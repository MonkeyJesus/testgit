package com.cwb.atmweb.entity;

public class City {
	// Fields

		private Long id;
		private Integer level;
		private String name;
		private String pCode;
		private String code;

		// Constructors

		/** default constructor */
		public City() {
		}

		/** full constructor */
		public City(Integer level, String name, String pCode, String code) {
			this.level = level;
			this.name = name;
			this.pCode = pCode;
			this.code = code;
		}

		// Property accessors

		public Long getId() {
			return this.id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public Integer getLevel() {
			return this.level;
		}

		public void setLevel(Integer level) {
			this.level = level;
		}

		public String getName() {
			return this.name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getPCode() {
			return this.pCode;
		}

		public void setPCode(String pCode) {
			this.pCode = pCode;
		}

		public String getCode() {
			return this.code;
		}

		public void setCode(String code) {
			this.code = code;
		}
}
