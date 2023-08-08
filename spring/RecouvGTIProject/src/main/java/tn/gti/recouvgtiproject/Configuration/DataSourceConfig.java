package tn.gti.recouvgtiproject.Configuration;

import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
public class DataSourceConfig {
/*
    @Value("${jdbc:mysql://localhost/RecouvDB}")
    private String dataSourceUrl;

    @Value("${root}")
    private String dataSourceUsername;

    @Value("${}")
    private String dataSourcePassword;

    @Value("${RecouvDB}")
    private String dataSourceDriverClassName;

    @Bean
    public DataSource dataSource() {
        HikariDataSource dataSource = new HikariDataSource();
        dataSource.setJdbcUrl(dataSourceUrl);
        dataSource.setUsername(dataSourceUsername);
        dataSource.setPassword(dataSourcePassword);
        dataSource.setDriverClassName(dataSourceDriverClassName);
        return dataSource;
    }*/
}