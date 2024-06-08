package tn.iit.projetjee.dao;

import tn.iit.projetjee.entity.Group;

import java.util.List;

public interface GroupDao {
    List<Group> getAllGroups();
    Group getGroupById(int id);
    void addGroup(Group matiere);
    void updateGroup(Group matiere);
    void deleteGroup(int id);
}
