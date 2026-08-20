package lk.jiat.scm.entities.entity;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "customs_document")
public class CustomsDocument implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;

    @Enumerated(EnumType.STRING)
    @Column(name = "document_type", length = 30, nullable = false)
    private DocumentType documentType;

    @Enumerated(EnumType.STRING)
    @Column(name = "declaration_status", length = 20, nullable = false)
    private DeclarationStatus declarationStatus;

    @Column(name = "hs_code", length = 20)
    private String hsCode; // e.g., HS-8517.12 (For electronic/supply items)

    @Column(name = "trade_agreement", length = 50)
    private String tradeAgreement; // e.g., "APTA / Free Trade Agreement"

    @Column(name = "estimated_duty")
    private double estimatedDuty; // Calculated tax/duty

    @Enumerated(EnumType.STRING)
    @Column(name = "compliance_status", length = 20)
    private ComplianceStatus complianceStatus;

    @Column(name = "generated_at")
    private LocalDateTime generatedAt;

    public CustomsDocument() {}

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Order getOrder() { return order; }
    public void setOrder(Order order) { this.order = order; }

    public DocumentType getDocumentType() { return documentType; }
    public void setDocumentType(DocumentType documentType) { this.documentType = documentType; }

    public DeclarationStatus getDeclarationStatus() { return declarationStatus; }
    public void setDeclarationStatus(DeclarationStatus declarationStatus) { this.declarationStatus = declarationStatus; }

    public String getHsCode() { return hsCode; }
    public void setHsCode(String hsCode) { this.hsCode = hsCode; }

    public String getTradeAgreement() { return tradeAgreement; }
    public void setTradeAgreement(String tradeAgreement) { this.tradeAgreement = tradeAgreement; }

    public double getEstimatedDuty() { return estimatedDuty; }
    public void setEstimatedDuty(double estimatedDuty) { this.estimatedDuty = estimatedDuty; }

    public ComplianceStatus getComplianceStatus() { return complianceStatus; }
    public void setComplianceStatus(ComplianceStatus complianceStatus) { this.complianceStatus = complianceStatus; }

    public LocalDateTime getGeneratedAt() { return generatedAt; }
    public void setGeneratedAt(LocalDateTime generatedAt) { this.generatedAt = generatedAt; }
}