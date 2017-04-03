package query;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Storage implements Serializable {

    public Storage(String wid, String grank, String keyword, String title, String url, String category, String hits, String boolScore, String score) {
        this.wid = wid;
        this.grank = grank;
        this.keyword = keyword;
        this.title = title;
        this.url = url;
        this.category = category;
        this.hits = hits;
        this.boolScore = boolScore;
        this.score = score;
    }
    private String wid;
    private String grank;
    private String keyword;
    private String title;
    private String url;
    private String category;
    private String hits;
    private String boolScore;
    private String score;

    public String getBoolScore() {
        return boolScore;
    }

    public void setBoolScore(String boolScore) {
        this.boolScore = boolScore;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getWid() {
        return this.wid;
    }

    public void setWid(String wid) {
        this.wid = wid;
    }

    public String getGrank() {
        return this.grank;
    }

    public void setGrank(String grank) {
        this.grank = grank;
    }

    public String getKey() {
        return this.grank;
    }

    public void setKey(String key) {
        this.keyword = keyword;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getCategories() {
        return this.category;
    }

    public void setCategories(String category) {
        this.category = category;
    }

    public String getHits() {
        return this.hits;
    }

    public void setHits(String hits) {
        this.hits = hits;
    }

    public String toString() {
        return "Web ID " + getWid() + ": " + getTitle() + " (" + getUrl() + ")";
    }

    static double cosine_similarity(Map<String, Double> v1, Map<String, Double> v2) {
        Set<String> both = new HashSet(v1.keySet());
        both.retainAll(v2.keySet());
        double sclar = 0, norm1 = 0, norm2 = 0;
        for (String k : both) {
            sclar += v1.get(k) * v2.get(k);
        }
        for (String k : v1.keySet()) {
            norm1 += v1.get(k) * v1.get(k);
        }
        for (String k : v2.keySet()) {
            norm2 += v2.get(k) * v2.get(k);
        }
        return sclar / Math.sqrt(norm1 * norm2);
    }
}