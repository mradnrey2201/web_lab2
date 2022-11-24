package com.example.lab_2.state;

import com.example.lab_2.models.Point;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.LinkedList;

public class State {
    LinkedHashMap<String, LinkedList<Point>> map = new LinkedHashMap<>();

    public void add(String sessionId, Point point) {
        if (map.containsKey(sessionId)) {
            map.get(sessionId).add(point);
        } else {
            map.put(sessionId, new LinkedList<>());
            map.get(sessionId).add(point);
        }
    }

    public LinkedList<Point> getList(String sessionId) {
        return map.get(sessionId);
    }

    public boolean contains(String sessionId){
        return map.containsKey(sessionId);
    }
}
