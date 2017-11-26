package entities;

import javax.persistence.*;

@Entity
@Table(name = "toy_one_language")
public class ToyLanguage {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "toy_language_id")
    private long id;
    @Column(name = "toy_name")
    private String name;
    @Column(name = "toy_description", columnDefinition = "TEXT")
    private String description;
    @Column(name = "toy_info", columnDefinition = "TEXT")
    private String moreInfo;
    @Column(name = "toy_reviews", columnDefinition = "TEXT")
    private String reviews;

    public ToyLanguage() {
    }

    public ToyLanguage(String name, String description, String moreInfo, String reviews) {
        this.name = name;
        this.description = description;
        this.moreInfo = moreInfo;
        this.reviews = reviews;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMoreInfo() {
        return moreInfo;
    }

    public void setMoreInfo(String moreInfo) {
        this.moreInfo = moreInfo;
    }

    public String getReviews() {
        return reviews;
    }

    public void setReviews(String reviews) {
        this.reviews = reviews;
    }
}
