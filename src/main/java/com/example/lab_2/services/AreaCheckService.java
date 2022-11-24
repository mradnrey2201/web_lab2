package com.example.lab_2.services;

import java.security.InvalidParameterException;
import java.util.LinkedList;

public class AreaCheckService {

    public void validate(int x, float y, float r) {
        LinkedList<Float> rValues = new LinkedList<Float>();
        rValues.add(1F);
        rValues.add(1.5F);
        rValues.add(2F);
        rValues.add(2.5F);
        rValues.add(3F);

        if (x < -5 || x > 3) {
            throw new InvalidParameterException("X must be from -5 to 3");
        }
        if (y < -3 || y > 3) {
            throw new InvalidParameterException("Y must be from -3 to 3");
        }
        if (!rValues.contains(r)) {
            throw new InvalidParameterException("Wrong R");
        }
    }

    public Boolean checkHit(int x, float y, float r) {
        if (x >= 0 && y >= 0 && x <= r/2 && y <= r) {
            return true;
        } else if (x <= 0 && y <= 0 && y>=-r/2) {
            if (y >= -1/2 * x-r) {
                return true;
            }
            return false;
        } else if (x >= 0 && y <= 0) {
            if ((Math.pow(x, 2) + Math.pow(y, 2)) <= Math.pow(r, 2)) {
                return true;
            }
            return false;
        } else return false;
    }
}
