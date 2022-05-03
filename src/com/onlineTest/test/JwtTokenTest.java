package com.onlineTest.test;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.junit.Test;

import java.util.Date;

public class JwtTokenTest {
    @Test
    public void generateToken() {
        try {
            Algorithm algorithm = Algorithm.HMAC256("secret");
            String token = JWT.create()
                    .withIssuer("OnlineTest")
                    .withIssuedAt(new Date())
                    .withExpiresAt(new Date(System.currentTimeMillis() + 86400000L * 1000))
                    .withClaim("username", "lyh")
                    .sign(algorithm);
            System.out.println(token);
        } catch (JWTCreationException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void verifyToken() {
        String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmVUZXN0IiwiZXhwIjoxNzM3OTYwMzEzLCJpYXQiOjE2NTE1NjAzMTMsInVzZXJuYW1lIjoibHloIn0.emrop-PCzK5714adOwmYYcECdVnAl3Ijhha90Jkr0sA";
        try {
            Algorithm algorithm = Algorithm.HMAC256("secret");
            JWTVerifier verifier = JWT.require(algorithm)
                    .withIssuer("OnlineTest")
                    .build();
            DecodedJWT jwt = verifier.verify(token);
            System.out.println(jwt.getClaims());
        } catch (JWTVerificationException e) {
            e.printStackTrace();
        }
    }
}
