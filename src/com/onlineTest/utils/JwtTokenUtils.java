package com.onlineTest.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.onlineTest.common.Constant;

import java.util.Date;
import java.util.Map;

public class JwtTokenUtils {
    public static String generateToken(Map<String, Object> claimMap) {
        Algorithm algorithm = Algorithm.HMAC256(Constant.SECRET);
        return JWT.create()
                .withIssuer(Constant.ISSUER)
                .withIssuedAt(new Date())
                .withExpiresAt(new Date(System.currentTimeMillis() + Constant.EXPIRATION_TIME * 1000))
                .withClaim("claims", claimMap)
                .sign(algorithm);
    }

    public static DecodedJWT verifyToken(String token) {
        Algorithm algorithm = Algorithm.HMAC256(Constant.SECRET);
        return JWT.require(algorithm)
                .withIssuer(Constant.ISSUER)
                .build().verify(token);
    }
}
