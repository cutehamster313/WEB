package entities;

import javax.persistence.*;

@Entity
@Table(name = "toy")
public class Toy {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "toy_id")
    private long id;
    @OneToOne
    @JoinColumn(name = "toy_ru")
    private ToyLanguage rus;
    @OneToOne
    @JoinColumn(name = "toy_en")
    private ToyLanguage eng;
    @OneToOne
    @JoinColumn(name = "toy_de")
    private ToyLanguage de;
    @Column(name = "toy_cost")
    private Integer cost;
    @Column(name = "toy_image")
    private String imageUrl;
    @Column(name = "toy_category")
    private Integer category;

    @Transient
    private String name;

    @Transient
    private String description;


    public Toy() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public ToyLanguage getToyLanguage(String locale) {
        String lang = locale.substring(0, 2).toLowerCase();
        switch (lang) {
            case "ru":
                return rus;
            case "de":
                return de;
            default:
                return eng;
        }
    }

    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
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
}
