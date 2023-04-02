package com.entrepoty.Entrepoty.domain.entities

import jakarta.persistence.*
import org.jetbrains.annotations.NotNull
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails

@Entity
@Table(name = "users")
class User : UserDetails {
    constructor(username: String, password: String, role: Role){
        this.username = username
        this.password = password
        this.role = role
    }
    @field:Id
    @field:GeneratedValue(strategy = GenerationType.AUTO)
    var id: Long = 0

    @field:NotNull
    var name: String = ""

    @field:Column(unique = true)
    @field:NotNull
    private var username: String = ""

    @field:NotNull
    private var password: String = ""

    @field:NotNull
    @field:Enumerated(EnumType.ORDINAL)
    var role: Role = Role.USER;

    var profile_url: String = "";

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