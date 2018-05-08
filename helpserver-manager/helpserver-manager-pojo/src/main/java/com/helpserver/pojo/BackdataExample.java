package com.helpserver.pojo;

import java.util.ArrayList;
import java.util.List;

public class BackdataExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public BackdataExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo=pageNo;
        this.startRow = (pageNo-1)*this.pageSize;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setStartRow(Integer startRow) {
        this.startRow=startRow;
    }

    public Integer getStartRow() {
        return startRow;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize=pageSize;
        this.startRow = (pageNo-1)*this.pageSize;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setFields(String fields) {
        this.fields=fields;
    }

    public String getFields() {
        return fields;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andAllmoneyIsNull() {
            addCriterion("allMoney is null");
            return (Criteria) this;
        }

        public Criteria andAllmoneyIsNotNull() {
            addCriterion("allMoney is not null");
            return (Criteria) this;
        }

        public Criteria andAllmoneyEqualTo(Integer value) {
            addCriterion("allMoney =", value, "allmoney");
            return (Criteria) this;
        }

        public Criteria andAllmoneyNotEqualTo(Integer value) {
            addCriterion("allMoney <>", value, "allmoney");
            return (Criteria) this;
        }

        public Criteria andAllmoneyGreaterThan(Integer value) {
            addCriterion("allMoney >", value, "allmoney");
            return (Criteria) this;
        }

        public Criteria andAllmoneyGreaterThanOrEqualTo(Integer value) {
            addCriterion("allMoney >=", value, "allmoney");
            return (Criteria) this;
        }

        public Criteria andAllmoneyLessThan(Integer value) {
            addCriterion("allMoney <", value, "allmoney");
            return (Criteria) this;
        }

        public Criteria andAllmoneyLessThanOrEqualTo(Integer value) {
            addCriterion("allMoney <=", value, "allmoney");
            return (Criteria) this;
        }

        public Criteria andAllmoneyIn(List<Integer> values) {
            addCriterion("allMoney in", values, "allmoney");
            return (Criteria) this;
        }

        public Criteria andAllmoneyNotIn(List<Integer> values) {
            addCriterion("allMoney not in", values, "allmoney");
            return (Criteria) this;
        }

        public Criteria andAllmoneyBetween(Integer value1, Integer value2) {
            addCriterion("allMoney between", value1, value2, "allmoney");
            return (Criteria) this;
        }

        public Criteria andAllmoneyNotBetween(Integer value1, Integer value2) {
            addCriterion("allMoney not between", value1, value2, "allmoney");
            return (Criteria) this;
        }

        public Criteria andAllmenIsNull() {
            addCriterion("allMen is null");
            return (Criteria) this;
        }

        public Criteria andAllmenIsNotNull() {
            addCriterion("allMen is not null");
            return (Criteria) this;
        }

        public Criteria andAllmenEqualTo(Integer value) {
            addCriterion("allMen =", value, "allmen");
            return (Criteria) this;
        }

        public Criteria andAllmenNotEqualTo(Integer value) {
            addCriterion("allMen <>", value, "allmen");
            return (Criteria) this;
        }

        public Criteria andAllmenGreaterThan(Integer value) {
            addCriterion("allMen >", value, "allmen");
            return (Criteria) this;
        }

        public Criteria andAllmenGreaterThanOrEqualTo(Integer value) {
            addCriterion("allMen >=", value, "allmen");
            return (Criteria) this;
        }

        public Criteria andAllmenLessThan(Integer value) {
            addCriterion("allMen <", value, "allmen");
            return (Criteria) this;
        }

        public Criteria andAllmenLessThanOrEqualTo(Integer value) {
            addCriterion("allMen <=", value, "allmen");
            return (Criteria) this;
        }

        public Criteria andAllmenIn(List<Integer> values) {
            addCriterion("allMen in", values, "allmen");
            return (Criteria) this;
        }

        public Criteria andAllmenNotIn(List<Integer> values) {
            addCriterion("allMen not in", values, "allmen");
            return (Criteria) this;
        }

        public Criteria andAllmenBetween(Integer value1, Integer value2) {
            addCriterion("allMen between", value1, value2, "allmen");
            return (Criteria) this;
        }

        public Criteria andAllmenNotBetween(Integer value1, Integer value2) {
            addCriterion("allMen not between", value1, value2, "allmen");
            return (Criteria) this;
        }

        public Criteria andAllordersIsNull() {
            addCriterion("allOrders is null");
            return (Criteria) this;
        }

        public Criteria andAllordersIsNotNull() {
            addCriterion("allOrders is not null");
            return (Criteria) this;
        }

        public Criteria andAllordersEqualTo(Integer value) {
            addCriterion("allOrders =", value, "allorders");
            return (Criteria) this;
        }

        public Criteria andAllordersNotEqualTo(Integer value) {
            addCriterion("allOrders <>", value, "allorders");
            return (Criteria) this;
        }

        public Criteria andAllordersGreaterThan(Integer value) {
            addCriterion("allOrders >", value, "allorders");
            return (Criteria) this;
        }

        public Criteria andAllordersGreaterThanOrEqualTo(Integer value) {
            addCriterion("allOrders >=", value, "allorders");
            return (Criteria) this;
        }

        public Criteria andAllordersLessThan(Integer value) {
            addCriterion("allOrders <", value, "allorders");
            return (Criteria) this;
        }

        public Criteria andAllordersLessThanOrEqualTo(Integer value) {
            addCriterion("allOrders <=", value, "allorders");
            return (Criteria) this;
        }

        public Criteria andAllordersIn(List<Integer> values) {
            addCriterion("allOrders in", values, "allorders");
            return (Criteria) this;
        }

        public Criteria andAllordersNotIn(List<Integer> values) {
            addCriterion("allOrders not in", values, "allorders");
            return (Criteria) this;
        }

        public Criteria andAllordersBetween(Integer value1, Integer value2) {
            addCriterion("allOrders between", value1, value2, "allorders");
            return (Criteria) this;
        }

        public Criteria andAllordersNotBetween(Integer value1, Integer value2) {
            addCriterion("allOrders not between", value1, value2, "allorders");
            return (Criteria) this;
        }

        public Criteria andYearIsNull() {
            addCriterion("year is null");
            return (Criteria) this;
        }

        public Criteria andYearIsNotNull() {
            addCriterion("year is not null");
            return (Criteria) this;
        }

        public Criteria andYearEqualTo(Integer value) {
            addCriterion("year =", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearNotEqualTo(Integer value) {
            addCriterion("year <>", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearGreaterThan(Integer value) {
            addCriterion("year >", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearGreaterThanOrEqualTo(Integer value) {
            addCriterion("year >=", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearLessThan(Integer value) {
            addCriterion("year <", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearLessThanOrEqualTo(Integer value) {
            addCriterion("year <=", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearIn(List<Integer> values) {
            addCriterion("year in", values, "year");
            return (Criteria) this;
        }

        public Criteria andYearNotIn(List<Integer> values) {
            addCriterion("year not in", values, "year");
            return (Criteria) this;
        }

        public Criteria andYearBetween(Integer value1, Integer value2) {
            addCriterion("year between", value1, value2, "year");
            return (Criteria) this;
        }

        public Criteria andYearNotBetween(Integer value1, Integer value2) {
            addCriterion("year not between", value1, value2, "year");
            return (Criteria) this;
        }

        public Criteria andMonthIsNull() {
            addCriterion("month is null");
            return (Criteria) this;
        }

        public Criteria andMonthIsNotNull() {
            addCriterion("month is not null");
            return (Criteria) this;
        }

        public Criteria andMonthEqualTo(Integer value) {
            addCriterion("month =", value, "month");
            return (Criteria) this;
        }

        public Criteria andMonthNotEqualTo(Integer value) {
            addCriterion("month <>", value, "month");
            return (Criteria) this;
        }

        public Criteria andMonthGreaterThan(Integer value) {
            addCriterion("month >", value, "month");
            return (Criteria) this;
        }

        public Criteria andMonthGreaterThanOrEqualTo(Integer value) {
            addCriterion("month >=", value, "month");
            return (Criteria) this;
        }

        public Criteria andMonthLessThan(Integer value) {
            addCriterion("month <", value, "month");
            return (Criteria) this;
        }

        public Criteria andMonthLessThanOrEqualTo(Integer value) {
            addCriterion("month <=", value, "month");
            return (Criteria) this;
        }

        public Criteria andMonthIn(List<Integer> values) {
            addCriterion("month in", values, "month");
            return (Criteria) this;
        }

        public Criteria andMonthNotIn(List<Integer> values) {
            addCriterion("month not in", values, "month");
            return (Criteria) this;
        }

        public Criteria andMonthBetween(Integer value1, Integer value2) {
            addCriterion("month between", value1, value2, "month");
            return (Criteria) this;
        }

        public Criteria andMonthNotBetween(Integer value1, Integer value2) {
            addCriterion("month not between", value1, value2, "month");
            return (Criteria) this;
        }

        public Criteria andMonthmoneyIsNull() {
            addCriterion("monthMoney is null");
            return (Criteria) this;
        }

        public Criteria andMonthmoneyIsNotNull() {
            addCriterion("monthMoney is not null");
            return (Criteria) this;
        }

        public Criteria andMonthmoneyEqualTo(Integer value) {
            addCriterion("monthMoney =", value, "monthmoney");
            return (Criteria) this;
        }

        public Criteria andMonthmoneyNotEqualTo(Integer value) {
            addCriterion("monthMoney <>", value, "monthmoney");
            return (Criteria) this;
        }

        public Criteria andMonthmoneyGreaterThan(Integer value) {
            addCriterion("monthMoney >", value, "monthmoney");
            return (Criteria) this;
        }

        public Criteria andMonthmoneyGreaterThanOrEqualTo(Integer value) {
            addCriterion("monthMoney >=", value, "monthmoney");
            return (Criteria) this;
        }

        public Criteria andMonthmoneyLessThan(Integer value) {
            addCriterion("monthMoney <", value, "monthmoney");
            return (Criteria) this;
        }

        public Criteria andMonthmoneyLessThanOrEqualTo(Integer value) {
            addCriterion("monthMoney <=", value, "monthmoney");
            return (Criteria) this;
        }

        public Criteria andMonthmoneyIn(List<Integer> values) {
            addCriterion("monthMoney in", values, "monthmoney");
            return (Criteria) this;
        }

        public Criteria andMonthmoneyNotIn(List<Integer> values) {
            addCriterion("monthMoney not in", values, "monthmoney");
            return (Criteria) this;
        }

        public Criteria andMonthmoneyBetween(Integer value1, Integer value2) {
            addCriterion("monthMoney between", value1, value2, "monthmoney");
            return (Criteria) this;
        }

        public Criteria andMonthmoneyNotBetween(Integer value1, Integer value2) {
            addCriterion("monthMoney not between", value1, value2, "monthmoney");
            return (Criteria) this;
        }

        public Criteria andMonthmenIsNull() {
            addCriterion("monthMen is null");
            return (Criteria) this;
        }

        public Criteria andMonthmenIsNotNull() {
            addCriterion("monthMen is not null");
            return (Criteria) this;
        }

        public Criteria andMonthmenEqualTo(Integer value) {
            addCriterion("monthMen =", value, "monthmen");
            return (Criteria) this;
        }

        public Criteria andMonthmenNotEqualTo(Integer value) {
            addCriterion("monthMen <>", value, "monthmen");
            return (Criteria) this;
        }

        public Criteria andMonthmenGreaterThan(Integer value) {
            addCriterion("monthMen >", value, "monthmen");
            return (Criteria) this;
        }

        public Criteria andMonthmenGreaterThanOrEqualTo(Integer value) {
            addCriterion("monthMen >=", value, "monthmen");
            return (Criteria) this;
        }

        public Criteria andMonthmenLessThan(Integer value) {
            addCriterion("monthMen <", value, "monthmen");
            return (Criteria) this;
        }

        public Criteria andMonthmenLessThanOrEqualTo(Integer value) {
            addCriterion("monthMen <=", value, "monthmen");
            return (Criteria) this;
        }

        public Criteria andMonthmenIn(List<Integer> values) {
            addCriterion("monthMen in", values, "monthmen");
            return (Criteria) this;
        }

        public Criteria andMonthmenNotIn(List<Integer> values) {
            addCriterion("monthMen not in", values, "monthmen");
            return (Criteria) this;
        }

        public Criteria andMonthmenBetween(Integer value1, Integer value2) {
            addCriterion("monthMen between", value1, value2, "monthmen");
            return (Criteria) this;
        }

        public Criteria andMonthmenNotBetween(Integer value1, Integer value2) {
            addCriterion("monthMen not between", value1, value2, "monthmen");
            return (Criteria) this;
        }

        public Criteria andMonthordersIsNull() {
            addCriterion("monthOrders is null");
            return (Criteria) this;
        }

        public Criteria andMonthordersIsNotNull() {
            addCriterion("monthOrders is not null");
            return (Criteria) this;
        }

        public Criteria andMonthordersEqualTo(Integer value) {
            addCriterion("monthOrders =", value, "monthorders");
            return (Criteria) this;
        }

        public Criteria andMonthordersNotEqualTo(Integer value) {
            addCriterion("monthOrders <>", value, "monthorders");
            return (Criteria) this;
        }

        public Criteria andMonthordersGreaterThan(Integer value) {
            addCriterion("monthOrders >", value, "monthorders");
            return (Criteria) this;
        }

        public Criteria andMonthordersGreaterThanOrEqualTo(Integer value) {
            addCriterion("monthOrders >=", value, "monthorders");
            return (Criteria) this;
        }

        public Criteria andMonthordersLessThan(Integer value) {
            addCriterion("monthOrders <", value, "monthorders");
            return (Criteria) this;
        }

        public Criteria andMonthordersLessThanOrEqualTo(Integer value) {
            addCriterion("monthOrders <=", value, "monthorders");
            return (Criteria) this;
        }

        public Criteria andMonthordersIn(List<Integer> values) {
            addCriterion("monthOrders in", values, "monthorders");
            return (Criteria) this;
        }

        public Criteria andMonthordersNotIn(List<Integer> values) {
            addCriterion("monthOrders not in", values, "monthorders");
            return (Criteria) this;
        }

        public Criteria andMonthordersBetween(Integer value1, Integer value2) {
            addCriterion("monthOrders between", value1, value2, "monthorders");
            return (Criteria) this;
        }

        public Criteria andMonthordersNotBetween(Integer value1, Integer value2) {
            addCriterion("monthOrders not between", value1, value2, "monthorders");
            return (Criteria) this;
        }

        public Criteria andTimeIsNull() {
            addCriterion("time is null");
            return (Criteria) this;
        }

        public Criteria andTimeIsNotNull() {
            addCriterion("time is not null");
            return (Criteria) this;
        }

        public Criteria andTimeEqualTo(String value) {
            addCriterion("time =", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotEqualTo(String value) {
            addCriterion("time <>", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeGreaterThan(String value) {
            addCriterion("time >", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeGreaterThanOrEqualTo(String value) {
            addCriterion("time >=", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeLessThan(String value) {
            addCriterion("time <", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeLessThanOrEqualTo(String value) {
            addCriterion("time <=", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeLike(String value) {
            addCriterion("time like", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotLike(String value) {
            addCriterion("time not like", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeIn(List<String> values) {
            addCriterion("time in", values, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotIn(List<String> values) {
            addCriterion("time not in", values, "time");
            return (Criteria) this;
        }

        public Criteria andTimeBetween(String value1, String value2) {
            addCriterion("time between", value1, value2, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotBetween(String value1, String value2) {
            addCriterion("time not between", value1, value2, "time");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}