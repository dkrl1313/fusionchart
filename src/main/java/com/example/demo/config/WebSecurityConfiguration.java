package com.example.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.boot.autoconfigure.security.oauth2.resource.ResourceServerProperties;
import org.springframework.boot.autoconfigure.security.oauth2.resource.UserInfoTokenServices;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.NestedConfigurationProperty;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.filter.OAuth2ClientAuthenticationProcessingFilter;
import org.springframework.security.oauth2.client.filter.OAuth2ClientContextFilter;
import org.springframework.security.oauth2.client.token.grant.code.AuthorizationCodeResourceDetails;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.web.filter.CompositeFilter;

import javax.servlet.Filter;
import java.util.ArrayList;
import java.util.List;

@EnableOAuth2Sso
@Configuration
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Qualifier("oauth2ClientContext")
    @Autowired
    OAuth2ClientContext oauth2ClientContext;

//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.authorizeRequests()
//                .anyRequest().authenticated()
//                .and()
//                .oauth2Login();
//
//        http.logout()
//                .invalidateHttpSession(true)
//                .logoutUrl("/logout")
//                .deleteCookies("JSESSIONID", "SPRING_SECURITY_REMEMBER_ME_COOKIE")
//                .logoutSuccessUrl("/");
//
//    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http.antMatcher("/**")
//                .addFilterBefore(ssoFilter(), BasicAuthenticationFilter.class)
//                .authorizeRequests()
//                .antMatchers("/", "/connect**", "/webjars/**")
//                .permitAll()
//                .anyRequest()
//                .authenticated()
//                .and()
//                .logout()
//                .logoutSuccessUrl("/").permitAll().and().csrf()
//                .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse());
        http.antMatcher("/**")
                .authorizeRequests()
                .antMatchers("/**", "/login**", "/webjars/**", "/static/**").permitAll()
                .anyRequest().authenticated()
                .and().exceptionHandling()
                .authenticationEntryPoint(new LoginUrlAuthenticationEntryPoint("/"));
    }

    private Filter ssoFilter() {

        CompositeFilter filter = new CompositeFilter();
        List<Filter> filters = new ArrayList<>();

        OAuth2ClientAuthenticationProcessingFilter facebookFilter = new OAuth2ClientAuthenticationProcessingFilter(
                "/connect/facebook");
        OAuth2RestTemplate facebookTemplate = new OAuth2RestTemplate(facebook().getClient(), oauth2ClientContext);
        facebookFilter.setRestTemplate(facebookTemplate);
        UserInfoTokenServices tokenServices = new UserInfoTokenServices(facebook().getResource().getUserInfoUri(),
                facebook().getClient().getClientId());
        tokenServices.setRestTemplate(facebookTemplate);
        facebookFilter.setTokenServices(tokenServices);


        OAuth2ClientAuthenticationProcessingFilter googleFilter = new OAuth2ClientAuthenticationProcessingFilter(
                "/connect/google");
        OAuth2RestTemplate googleTemplate = new OAuth2RestTemplate(google().getClient(), oauth2ClientContext);
        googleFilter.setRestTemplate(googleTemplate);
        tokenServices = new UserInfoTokenServices(google().getResource().getUserInfoUri(), google().getClient().getClientId());
        tokenServices.setRestTemplate(googleTemplate);
        googleFilter.setTokenServices(tokenServices);

        filters.add(facebookFilter);
        filters.add(googleFilter);

        filter.setFilters(filters);

        return filter;
    }

    @Bean
    public FilterRegistrationBean oauth2ClientFilterRegistration(OAuth2ClientContextFilter filter) {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(filter);
        registration.setOrder(-100);
        return registration;
    }

    @Bean
    @ConfigurationProperties("google")
    public ClientResources google() {
        return new ClientResources();
    }

    @Bean
    @ConfigurationProperties("facebook")
    public ClientResources facebook() {
        return new ClientResources();
    }

//    @Bean
//    @ConfigurationProperties("facebook.client")
//    public AuthorizationCodeResourceDetails facebook() {
//        return new AuthorizationCodeResourceDetails();
//    }
//
//    @Bean
//    @ConfigurationProperties("facebook.resource")
//    public ResourceServerProperties facebookResource() {
//        return new ResourceServerProperties();
//    }
//
//    @Bean
//    @ConfigurationProperties("google.client")
//    public AuthorizationCodeResourceDetails google() {
//        return new AuthorizationCodeResourceDetails();
//    }
//
//    @Bean
//    @ConfigurationProperties("google.resource")
//    public ResourceServerProperties googleResource() {
//        return new ResourceServerProperties();
//    }
}

class ClientResources {

    @NestedConfigurationProperty
    private AuthorizationCodeResourceDetails client = new AuthorizationCodeResourceDetails();

    @NestedConfigurationProperty
    private ResourceServerProperties resource = new ResourceServerProperties();

    public AuthorizationCodeResourceDetails getClient() {
        return client;
    }

    public ResourceServerProperties getResource() {
        return resource;
    }
}
