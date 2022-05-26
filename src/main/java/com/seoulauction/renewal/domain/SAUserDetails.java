package com.seoulauction.renewal.domain;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SAUserDetails implements UserDetails {

	private static final long serialVersionUID = 1L;

	private int userNo;
	private String loginId;
    private String password;
    private String userKind;
	private String userNm;
	private String agreeYn;
	private String ip;
	private List<GrantedAuthority> authorities;
	private String zipNo;
	private String addr;
	
    @Override
    public String getUsername() {
    	return this.loginId;
    }

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.authorities;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}
