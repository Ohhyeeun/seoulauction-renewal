package com.seoulauction.renewal.config.database;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import javax.sql.DataSource;

@Configuration
@MapperScan(value = "com.seoulauction.renewal.mapper.aws", sqlSessionFactoryRef = "awsFactory")
public class AWSDataBaseConfig {

    @Primary
    @Bean(name = "awsDatasource")
    @ConfigurationProperties(prefix = "spring.datasource.aws")
    public DataSource awsDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Primary
    @Bean(name = "awsFactory")
    public SqlSessionFactory aswSqlSessionFactory(@Qualifier("awsDatasource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
        sqlSessionFactory.setDataSource(dataSource);
        sqlSessionFactory.setTypeAliasesPackage("com.seoulauction.renewal.domain");
        sqlSessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:/mybatis/mapper/aws/*.xml"));
        sqlSessionFactory.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("classpath:/mybatis/config/mybatis-config.xml"));
        return sqlSessionFactory.getObject();
    }

    @Primary
    @Bean(name = "awsSqlSession")
    public SqlSessionTemplate awsSqlSession(@Qualifier("awsFactory")SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Primary
    @Bean(name = "awsTransactionManager")
    public PlatformTransactionManager awsTransactionManager() {
        return new DataSourceTransactionManager(awsDataSource());
    }

}
