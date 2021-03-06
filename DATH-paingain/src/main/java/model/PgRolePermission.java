package model;
// Generated Jun 26, 2018 11:38:35 AM by Hibernate Tools 4.3.5.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * PgRolePermission generated by hbm2java
 */
@Entity
@Table(name = "pg_role_permission", catalog = "dath")
public class PgRolePermission implements java.io.Serializable {

	private Integer permissionId;
	private PgModules pgModules;
	private PgRoles pgRoles;
	private Boolean isInsert;
	private Boolean isUpdate;
	private Boolean isRead;
	private Integer perStatus;
	private String description;

	public PgRolePermission() {
	}

	public PgRolePermission(PgModules pgModules, PgRoles pgRoles) {
		this.pgModules = pgModules;
		this.pgRoles = pgRoles;
	}

	public PgRolePermission(Integer permissionId,PgModules pgModules, PgRoles pgRoles, Boolean isInsert, Boolean isUpdate, Boolean isRead,
			Integer perStatus, String description) {
		this.permissionId = permissionId;
		this.pgModules = pgModules;
		this.pgRoles = pgRoles;
		this.isInsert = isInsert;
		this.isUpdate = isUpdate;
		this.isRead = isRead;
		this.perStatus = perStatus;
		this.description = description;
	}
	public PgRolePermission(PgModules pgModules, PgRoles pgRoles, Boolean isInsert, Boolean isUpdate, Boolean isRead,
			Integer perStatus, String description) {
		this.pgModules = pgModules;
		this.pgRoles = pgRoles;
		this.isInsert = isInsert;
		this.isUpdate = isUpdate;
		this.isRead = isRead;
		this.perStatus = perStatus;
		this.description = description;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "PERMISSION_ID", unique = true, nullable = false)
	public Integer getPermissionId() {
		return this.permissionId;
	}

	public void setPermissionId(Integer permissionId) {
		this.permissionId = permissionId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MODULE_ID", nullable = false)
	public PgModules getPgModules() {
		return this.pgModules;
	}

	public void setPgModules(PgModules pgModules) {
		this.pgModules = pgModules;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ROLE_ID", nullable = false)
	public PgRoles getPgRoles() {
		return this.pgRoles;
	}

	public void setPgRoles(PgRoles pgRoles) {
		this.pgRoles = pgRoles;
	}

	@Column(name = "IS_INSERT")
	public Boolean getIsInsert() {
		return this.isInsert;
	}

	public void setIsInsert(Boolean isInsert) {
		this.isInsert = isInsert;
	}

	@Column(name = "IS_UPDATE")
	public Boolean getIsUpdate() {
		return this.isUpdate;
	}

	public void setIsUpdate(Boolean isUpdate) {
		this.isUpdate = isUpdate;
	}

	@Column(name = "IS_READ")
	public Boolean getIsRead() {
		return this.isRead;
	}

	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}

	@Column(name = "PER_STATUS")
	public Integer getPerStatus() {
		return this.perStatus;
	}

	public void setPerStatus(Integer perStatus) {
		this.perStatus = perStatus;
	}

	@Column(name = "DESCRIPTION", length = 200)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
