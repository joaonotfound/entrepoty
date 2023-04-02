package com.entrepoty.Entrepoty.domain.entities

data class AuthenticationModel (var name: String,
                                var username: String,
                                var accessToken: String,
                                var profile_picture: String,);