package com.example.evoucher.common;

import java.security.SecureRandom;

public class RandomStringGenerator {
    // Define the characters to be used in the random string
    private static final String NUMERIC = "0123456789";
    private static final String ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    // Create a SecureRandom instance for better randomness
    private static final SecureRandom random = new SecureRandom();

    // Method to generate a random alphanumeric string of a given length
    public static String generateRandomNumeric(int length) {
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(NUMERIC.length());
            sb.append(NUMERIC.charAt(index));
        }
        return sb.toString();
    }

    // Method to generate a random alphabetic string of a given length
    public static String generateRandomAlphabetic(int length) {
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(ALPHABET.length());
            sb.append(ALPHABET.charAt(index));
        }
        return sb.toString();
    }
}
