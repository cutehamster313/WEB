package toys;

import java.io.Serializable;

public class Toy implements Serializable {
    private String name;
    private String language;
    private String picture;
    private String description;
    private String price;
    private String id;

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(String price) {
        this.price = price;
    }


    public String getName() {
        return name;
    }

    public String getPicture() {
        return picture;
    }

    public String getDescription() {
        return description;
    }

    public String getPrice() {
        return price;
    }

    public String getLanguage() {
        return language;
    }
}
