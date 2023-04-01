package com.entrepoty.Entrepoty.services

import io.jsonwebtoken.Claims
import io.jsonwebtoken.Jwts
import io.jsonwebtoken.SignatureAlgorithm
import io.jsonwebtoken.io.Decoders
import io.jsonwebtoken.security.Keys
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.stereotype.Service
import java.util.*
import java.util.function.Function
import javax.crypto.SecretKey
import kotlin.reflect.jvm.internal.impl.load.kotlin.JvmType

@Service
class JwtService {
    val SECRET_KEY: String = "ASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASDASD"
    fun extractUsername(jwt: String): String {
        return extractClaim(jwt, Claims::getSubject)
    }
    fun generateToken(user: UserDetails): String {
        return generateToken(HashMap(), user)
    }
    fun isTokenExpired(token: String): Boolean {
        return extractExpiration(token).before(Date())
    }
    fun extractExpiration(token: String): Date {
        return extractClaim(token, Claims::getExpiration)
    }

    fun isTokenValid(token: String, user: UserDetails): Boolean {
        val username: String = extractUsername(token)
        return (username.equals(user.username) && !isTokenExpired(token))
    }
    fun generateToken(extraClaims: Map<String, JvmType.Object>, user: UserDetails): String {
        return Jwts
            .builder()
            .setClaims(extraClaims)
            .setSubject(user.username)
            .setIssuedAt(Date(System.currentTimeMillis()))
            .setExpiration(Date(System.currentTimeMillis() + 1000 * 60 * 24))
            .signWith(getSignedKey(), SignatureAlgorithm.HS256)
            .compact()
    }
    fun getSignedKey(): SecretKey {
        val keyBytes: ByteArray = Decoders.BASE64.decode(SECRET_KEY)
        return Keys.hmacShaKeyFor(keyBytes);
    }

    fun <T>extractClaim(token: String, claimResolver: Function<Claims, T>): T{
        val claims = extractAllClaims(token);
        return claimResolver.apply(claims);
    }
    fun extractAllClaims(token: String): Claims {
        return Jwts.parserBuilder()
            .setSigningKey(getSignedKey())
            .build()
            .parseClaimsJws(token)
            .body
    }
}