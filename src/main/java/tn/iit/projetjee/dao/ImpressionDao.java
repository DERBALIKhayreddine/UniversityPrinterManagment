package tn.iit.projetjee.dao;

import tn.iit.projetjee.entity.Impression;

import java.util.List;
import java.util.Map;

public interface ImpressionDao {

    List<Impression> getAllImpressions();
    Impression getImpressionById(int id);
    void addImpression(Impression impression);
    void updateImpression(Impression impression);
    void deleteImpression(int id);
    List<Impression> getImpressionsByEnseignantId(int enseignantId);
    void updateImpressionState(int id, String state);
    List<Impression> getAllImpressionslog();
    List<Map<String, Object>> getImpressionsByMonth();
    Impression getImpressionByIdfordonw(int id);
}
