/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package query;

/**
 *
 * @author user
 */
public class Index {

    private String wid;
    private String grank;
    private String keyword;
    private String title;
    private String url;
    private String category;
    private String hits;
    private String boolScore;
    private String score;

    public Index(String wid, String grank, String keyword, String title, String url, String category, String hits, String boolScore, String score) {
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

    public String getWid() {
        return wid;
    }

    public void setWid(String wid) {
        this.wid = wid;
    }

    public String getGrank() {
        return grank;
    }

    public void setGrank(String grank) {
        this.grank = grank;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getHits() {
        return hits;
    }

    public void setHits(String hits) {
        this.hits = hits;
    }

    public String getBoolScore() {
        return boolScore;
    }

    public void setBoolScore(String boolScore) {
        this.boolScore = boolScore;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }
}
