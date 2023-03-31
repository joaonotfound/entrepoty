package com.entrepoty.Entrepoty.entities

import jakarta.persistence.*

import org.jetbrains.annotations.NotNull
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails
import java.awt.List

@Entity
@Table(name = "users")
class User : UserDetails {
    @field:Id
    @field:GeneratedValue(strategy = GenerationType.AUTO)
    var id: Long = 0

    @field:Column(unique = true)
    @field:NotNull
    var username: String = ""

    @field:NotNull
    var password: String = ""

    @field:NotNull
    @field:Enumerated(EnumType.ORDINAL)
    var role: Role = Role.USER;

    override fun getAuthorities(): MutableCollection<out GrantedAuthority> {
        return mutableListOf<GrantedAuthority>(SimpleGrantedAuthority(role.name));
    }

    override fun getPassword() = password;

    override fun getUsername() = username;

    override fun isAccountNonExpired() = true;

    override fun isAccountNonLocked() = true;

    override fun isCredentialsNonExpired() = true;

    override fun isEnabled() = true;
}