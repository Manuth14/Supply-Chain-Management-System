package lk.jiat.scm.entities.entity;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "routes")
public class Route implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "route_code", length = 50, nullable = false, unique = true)
    private String routeCode; // e.g., "RT-COL-GMP-01"

    @Column(name = "route_name", length = 100, nullable = false)
    private String routeName; // e.g., "Colombo to Gampaha Express Route"

    @Column(name = "origin_hub", length = 100, nullable = false)
    private String originHub; // e.g., "Colombo 03 Central Hub"

    @Column(name = "destination_hub", length = 100, nullable = false)
    private String destinationHub; // e.g., "Gampaha Distribution Center"

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 20, nullable = false)
    private RouteStatus status; // ACTIVE, INACTIVE, etc.

    @Column(name = "distance_km")
    private double distanceKm; // e.g., 35.5 km

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    // Constructors
    public Route() {
        this.createdAt = LocalDateTime.now();
    }

    public Route(String routeCode, String routeName, String originHub, String destinationHub, RouteStatus status, double distanceKm) {
        this.routeCode = routeCode;
        this.routeName = routeName;
        this.originHub = originHub;
        this.destinationHub = destinationHub;
        this.status = status;
        this.distanceKm = distanceKm;
        this.createdAt = LocalDateTime.now();
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getRouteCode() { return routeCode; }
    public void setRouteCode(String routeCode) { this.routeCode = routeCode; }

    public String getRouteName() { return routeName; }
    public void setRouteName(String routeName) { this.routeName = routeName; }

    public String getOriginHub() { return originHub; }
    public void setOriginHub(String originHub) { this.originHub = originHub; }

    public String getDestinationHub() { return destinationHub; }
    public void setDestinationHub(String destinationHub) { this.destinationHub = destinationHub; }

    public RouteStatus getStatus() { return status; }
    public void setStatus(RouteStatus status) { this.status = status; }

    public double getDistanceKm() { return distanceKm; }
    public void setDistanceKm(double distanceKm) { this.distanceKm = distanceKm; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}