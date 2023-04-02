package com.entrepoty.Entrepoty.main.config

import com.entrepoty.Entrepoty.services.JwtService
import jakarta.servlet.FilterChain
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.lang.NonNull
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource
import org.springframework.stereotype.Component
import org.springframework.web.filter.OncePerRequestFilter

@Component
class JwtAuthenticationFilter  () : OncePerRequestFilter() {
    @Autowired
    lateinit var jwtService: JwtService
    @Autowired
    lateinit var userDetailsService: UserDetailsService
    override fun doFilterInternal(
        @NonNull request: HttpServletRequest,
        @NonNull response: HttpServletResponse,
        @NonNull filterChain: FilterChain
    ) {
        val authHeader = request.getHeader("Authorization");
        if(authHeader == null || !authHeader.startsWith("Bearer ")) {
            filterChain.doFilter(request, response)
            return;
        }
        val jwt = authHeader.substring(7);
        var username = jwtService.extractUsername(jwt)
        if(username != null && SecurityContextHolder.getContext().authentication == null){
            val user = userDetailsService.loadUserByUsername(username);
            if(jwtService.isTokenValid(jwt, user)){
                var authToken = UsernamePasswordAuthenticationToken(
                    user, null,
                    user.authorities
                )
                authToken.details = WebAuthenticationDetailsSource().buildDetails(request);
                SecurityContextHolder.getContext().authentication = authToken
            }
        }
        filterChain.doFilter(request, response)
    }

}