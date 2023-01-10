package org.example;



import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        User user1 = new User(null, "addedUser");
        User user2 = new User(1, "originUser");
        List<User> users = Arrays.asList(user1, user2);
        Pair<List<User>, List<User>> comparedUsers = getComparedUsers(users);
        System.out.println(comparedUsers.getKey().get(0).getName());
        System.out.println(comparedUsers.getValue().get(0).getName());
    }

    private static Pair<List<User>, List<User>> getComparedUsers(List<User> users){
        List<User> originUsers = new ArrayList<>();
        List<User> newUsers = new ArrayList<>();
        users.forEach(user -> {
            if(user.getId() == null){
                newUsers.add(user);
            }else{
                originUsers.add(user);
            }
        });
        return ImmutablePair.of(originUsers,newUsers);
//        return new Pair<>(originUsers, newUsers);
    }
}
