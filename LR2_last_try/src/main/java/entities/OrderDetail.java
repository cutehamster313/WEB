package entities;

import javax.persistence.*;

@Entity
@Table(name = "order_detail")
public class OrderDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "detail_id")
    private long id;

    @ManyToOne
    @JoinColumn(name = "details_toy_id")
    private Toy toy;

    @Column(name = "quanity")
    private Integer quanity;

    @ManyToOne
    @JoinColumn(name = "details_order_id")
    private Order order;


    public OrderDetail(Integer quanity, Order order, Toy toy) {
        this.quanity = quanity;
        this.order = order;
        this.toy = toy;
    }

    public OrderDetail() {
    }

    public long getId() {
        return id;
    }

    public Integer getQuanity() {
        return quanity;
    }

    public Order getOrder() {
        return order;
    }

    public Toy getToy() {
        return toy;
    }
}
