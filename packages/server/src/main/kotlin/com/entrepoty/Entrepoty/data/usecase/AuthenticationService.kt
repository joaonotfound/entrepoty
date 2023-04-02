package com.entrepoty.Entrepoty.data.usecase

import arrow.core.Either
import com.entrepoty.Entrepoty.domain.entities.*
import com.entrepoty.Entrepoty.domain.usecase.LoginUsecase
import com.entrepoty.Entrepoty.domain.usecase.SignupUsecase
import com.entrepoty.Entrepoty.data.repositories.UserRepository
import com.entrepoty.Entrepoty.services.JwtService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.AuthenticationException
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Service

@Service
class AuthenticationService : SignupUsecase, LoginUsecase {
    @Autowired
    lateinit var userRepository: UserRepository;
    @Autowired
    lateinit var passwordEncoder: PasswordEncoder
    @Autowired
    lateinit var jwtService: JwtService
    @Autowired
    lateinit var authenticationManager: AuthenticationManager

    override fun loginAccount(account: LoginAccountModel): Either<DomainError, AuthenticationModel> {
        try {
            authenticationManager.authenticate(UsernamePasswordAuthenticationToken(account.username, account.password))
        }catch (e: AuthenticationException){
            return Either.Left(DomainError.notFound);
        }

        var user = userRepository.findByUsername(account.username).orElseThrow()
        var token = jwtService.generateToken(user);
        return Either.Right(AuthenticationModel(user.name, user.username, token, user.profile_url));
    }
    override fun registerAccount(account: CreateAccountModel): Either<DomainError, AuthenticationModel> {
        var existingAccount = userRepository.findByUsername(account.username)
        if(!existingAccount.isEmpty){
            return Either.Left(DomainError.conflict);
        }
        var user = User(account.username, passwordEncoder.encode(account.password), Role.USER)
        userRepository.save(user);
        var token = jwtService.generateToken(user);
        return Either.Right(AuthenticationModel(user.name, user.username, token, user.profile_url));
    }
}