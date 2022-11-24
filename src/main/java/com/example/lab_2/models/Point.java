package com.example.lab_2.models;

import java.io.Serializable;

public class Point implements Serializable {

    int x;
    float y;
    float r;

    boolean hitted;
    String currentTime;
    float executionTime;

    public Point() {
        this.x = 0;
        this.y = 0;
        this.r = 0;
        this.hitted = false;
        currentTime = null;
        executionTime = 0;
    }


    public Point(int x, float y, float r, boolean hitted, String currentTime, float executionTime) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.hitted = hitted;
        this.currentTime = currentTime;
        this.executionTime = executionTime;
    }

    public void setHitted(boolean hitted) {
        this.hitted = hitted;
    }

    public boolean isHitted() {
        return hitted;
    }

    public int getX() {
        return x;
    }

    public float getY() {
        return y;
    }

    public float getR() {
        return r;
    }

    public void setX(int x) {
        this.x = x;
    }

    public void setY(float y) {
        this.y = y;
    }

    public void setR(float r) {
        this.r = r;
    }

    public void setCurrentTime(String currentTime) {
        this.currentTime = currentTime;
    }

    public void setExecutionTime(float executionTime) {
        this.executionTime = executionTime;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public float getExecutionTime() {
        return executionTime;
    }
}
