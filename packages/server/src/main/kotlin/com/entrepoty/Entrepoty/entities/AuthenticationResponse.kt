package com.entrepoty.Entrepoty.entities

data class AuthenticationResponse (var name: String,
                                   var username: String,
                                   var accessToken: String,
                                   var profile_picture: String,);