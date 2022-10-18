package com.smi.trainingcenter.configuration;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Autowired
	UserDetailsService userDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth)throws Exception{
	auth.userDetailsService(userDetailsService);
	}
	
	public void configure(HttpSecurity htt)throws Exception{
		htt.authorizeRequests()
		.antMatchers("/admin").hasRole("ADMIN")
		.antMatchers("/user").hasAnyRole("ADMIN","USER")
		.antMatchers("/").permitAll()
		.and().formLogin();
		//.loginPage("/LoginPage");
//		.defaultSuccessUrl("/UserPage")  
//	      .and()  
//	      .logout()  
//	      .logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
		//htt.csrf().disable();
//        .authorizeRequests().antMatchers(HttpMethod.OPTIONS,"*/").permitAll()
//        .antMatchers(HttpMethod.GET,"/LoginPage").permitAll();

//		.permitAll()
//		.and()
//		.logout()
//		.permitAll().logoutUrl("/user");
//	
	}
			
	
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return NoOpPasswordEncoder.getInstance();
	}

}
