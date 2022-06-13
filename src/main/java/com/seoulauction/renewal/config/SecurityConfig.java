package com.seoulauction.renewal.config;

import com.seoulauction.renewal.auth.FrontAuthenticationProvider;
import com.seoulauction.renewal.auth.FrontLoginSuccessHandler;
import com.seoulauction.renewal.auth.RememberMeLoginSuccessHandler;
import com.seoulauction.renewal.auth.RememberMeService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.CorsUtils;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;


@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	private final RememberMeService rememberMeService;

	private final RememberMeLoginSuccessHandler rememberMeLoginSuccessHandler;

	private final FrontAuthenticationProvider frontAuthenticationProvider;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(frontAuthenticationProvider);
	}

	@Bean
    public SimpleUrlAuthenticationFailureHandler simpleUrlAuthenticationFailureHandler() {
		return new SimpleUrlAuthenticationFailureHandler("/login?error");
    }
	
	@Bean
	public AuthenticationSuccessHandler successHandler() {
	    return new FrontLoginSuccessHandler("/"); // Default targetUrl
	}

	@Override public void configure(WebSecurity web) throws Exception {
		web.httpFirewall(new DefaultHttpFirewall());

		web.ignoring()
			.antMatchers("/css/**, /js/**, *.ico");
		web.ignoring()
			.antMatchers(
					"/v2/api-docs", "/configuration/ui", "/swagger-resources",
					"/configuration/security", "/swagger-ui.html", "/webjars/**", "/swagger/**"
		);
	}


    @Override
    protected void configure(HttpSecurity security) throws Exception
    {
        security.httpBasic().disable();
		security.cors().configurationSource(corsConfigurationSource())
		.and()
            .csrf().disable()
            .authorizeRequests()
            .requestMatchers(PathRequest.toStaticResources().atCommonLocations()).permitAll()
			.requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
	        .antMatchers("/*").permitAll()
			.antMatchers("/api/**").permitAll()
			.antMatchers("/swagger-ui/**").permitAll()
			.antMatchers("/swagger-resources/**").permitAll()
			.antMatchers( "/favicon.ico").permitAll()
			.antMatchers("/customer/**").permitAll()
			.antMatchers("/mypage/**").authenticated()
			//.anyRequest().authenticated()
			.and()
			.formLogin()
				.loginPage("/login")
				.loginProcessingUrl("/processLogin")
				.usernameParameter("loginId")
				.passwordParameter("password")
				.failureUrl("/login?error")
				.failureHandler(simpleUrlAuthenticationFailureHandler())
				.successHandler(successHandler())
	            .and()
			.logout()
				.logoutUrl("/processLogout")
				.logoutSuccessUrl("/")
				.permitAll()
	            .and()
	        .rememberMe()
		        .key("SeoulAuction")
		        .rememberMeParameter("remember-me")
		        .tokenValiditySeconds(86400 * 30) // 1달
		        .userDetailsService(rememberMeService)
		        .authenticationSuccessHandler(rememberMeLoginSuccessHandler)
		        .and()
		    .sessionManagement()
	        	.maximumSessions(1)
	        	.maxSessionsPreventsLogin(false)
	        	.expiredUrl("/?maxSession=true");
	}
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
		configuration.addAllowedOriginPattern("*");
        configuration.addAllowedHeader("*");
        configuration.addAllowedMethod("*");
        configuration.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}