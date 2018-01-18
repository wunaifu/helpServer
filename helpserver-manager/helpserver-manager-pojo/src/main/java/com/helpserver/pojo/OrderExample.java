package com.helpserver.pojo;

import java.util.ArrayList;
import java.util.List;

public class OrderExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public OrderExample() {
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

        public Criteria andOrderidIsNull() {
            addCriterion("orderId is null");
            return (Criteria) this;
        }

        public Criteria andOrderidIsNotNull() {
            addCriterion("orderId is not null");
            return (Criteria) this;
        }

        public Criteria andOrderidEqualTo(Integer value) {
            addCriterion("orderId =", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotEqualTo(Integer value) {
            addCriterion("orderId <>", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidGreaterThan(Integer value) {
            addCriterion("orderId >", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidGreaterThanOrEqualTo(Integer value) {
            addCriterion("orderId >=", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidLessThan(Integer value) {
            addCriterion("orderId <", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidLessThanOrEqualTo(Integer value) {
            addCriterion("orderId <=", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidIn(List<Integer> values) {
            addCriterion("orderId in", values, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotIn(List<Integer> values) {
            addCriterion("orderId not in", values, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidBetween(Integer value1, Integer value2) {
            addCriterion("orderId between", value1, value2, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotBetween(Integer value1, Integer value2) {
            addCriterion("orderId not between", value1, value2, "orderid");
            return (Criteria) this;
        }

        public Criteria andSenderidIsNull() {
            addCriterion("senderId is null");
            return (Criteria) this;
        }

        public Criteria andSenderidIsNotNull() {
            addCriterion("senderId is not null");
            return (Criteria) this;
        }

        public Criteria andSenderidEqualTo(Integer value) {
            addCriterion("senderId =", value, "senderid");
            return (Criteria) this;
        }

        public Criteria andSenderidNotEqualTo(Integer value) {
            addCriterion("senderId <>", value, "senderid");
            return (Criteria) this;
        }

        public Criteria andSenderidGreaterThan(Integer value) {
            addCriterion("senderId >", value, "senderid");
            return (Criteria) this;
        }

        public Criteria andSenderidGreaterThanOrEqualTo(Integer value) {
            addCriterion("senderId >=", value, "senderid");
            return (Criteria) this;
        }

        public Criteria andSenderidLessThan(Integer value) {
            addCriterion("senderId <", value, "senderid");
            return (Criteria) this;
        }

        public Criteria andSenderidLessThanOrEqualTo(Integer value) {
            addCriterion("senderId <=", value, "senderid");
            return (Criteria) this;
        }

        public Criteria andSenderidIn(List<Integer> values) {
            addCriterion("senderId in", values, "senderid");
            return (Criteria) this;
        }

        public Criteria andSenderidNotIn(List<Integer> values) {
            addCriterion("senderId not in", values, "senderid");
            return (Criteria) this;
        }

        public Criteria andSenderidBetween(Integer value1, Integer value2) {
            addCriterion("senderId between", value1, value2, "senderid");
            return (Criteria) this;
        }

        public Criteria andSenderidNotBetween(Integer value1, Integer value2) {
            addCriterion("senderId not between", value1, value2, "senderid");
            return (Criteria) this;
        }

        public Criteria andTypeidIsNull() {
            addCriterion("typeId is null");
            return (Criteria) this;
        }

        public Criteria andTypeidIsNotNull() {
            addCriterion("typeId is not null");
            return (Criteria) this;
        }

        public Criteria andTypeidEqualTo(Integer value) {
            addCriterion("typeId =", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidNotEqualTo(Integer value) {
            addCriterion("typeId <>", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidGreaterThan(Integer value) {
            addCriterion("typeId >", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidGreaterThanOrEqualTo(Integer value) {
            addCriterion("typeId >=", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidLessThan(Integer value) {
            addCriterion("typeId <", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidLessThanOrEqualTo(Integer value) {
            addCriterion("typeId <=", value, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidIn(List<Integer> values) {
            addCriterion("typeId in", values, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidNotIn(List<Integer> values) {
            addCriterion("typeId not in", values, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidBetween(Integer value1, Integer value2) {
            addCriterion("typeId between", value1, value2, "typeid");
            return (Criteria) this;
        }

        public Criteria andTypeidNotBetween(Integer value1, Integer value2) {
            addCriterion("typeId not between", value1, value2, "typeid");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andCommissionIsNull() {
            addCriterion("commission is null");
            return (Criteria) this;
        }

        public Criteria andCommissionIsNotNull() {
            addCriterion("commission is not null");
            return (Criteria) this;
        }

        public Criteria andCommissionEqualTo(Integer value) {
            addCriterion("commission =", value, "commission");
            return (Criteria) this;
        }

        public Criteria andCommissionNotEqualTo(Integer value) {
            addCriterion("commission <>", value, "commission");
            return (Criteria) this;
        }

        public Criteria andCommissionGreaterThan(Integer value) {
            addCriterion("commission >", value, "commission");
            return (Criteria) this;
        }

        public Criteria andCommissionGreaterThanOrEqualTo(Integer value) {
            addCriterion("commission >=", value, "commission");
            return (Criteria) this;
        }

        public Criteria andCommissionLessThan(Integer value) {
            addCriterion("commission <", value, "commission");
            return (Criteria) this;
        }

        public Criteria andCommissionLessThanOrEqualTo(Integer value) {
            addCriterion("commission <=", value, "commission");
            return (Criteria) this;
        }

        public Criteria andCommissionIn(List<Integer> values) {
            addCriterion("commission in", values, "commission");
            return (Criteria) this;
        }

        public Criteria andCommissionNotIn(List<Integer> values) {
            addCriterion("commission not in", values, "commission");
            return (Criteria) this;
        }

        public Criteria andCommissionBetween(Integer value1, Integer value2) {
            addCriterion("commission between", value1, value2, "commission");
            return (Criteria) this;
        }

        public Criteria andCommissionNotBetween(Integer value1, Integer value2) {
            addCriterion("commission not between", value1, value2, "commission");
            return (Criteria) this;
        }

        public Criteria andMenaccountIsNull() {
            addCriterion("menAccount is null");
            return (Criteria) this;
        }

        public Criteria andMenaccountIsNotNull() {
            addCriterion("menAccount is not null");
            return (Criteria) this;
        }

        public Criteria andMenaccountEqualTo(Integer value) {
            addCriterion("menAccount =", value, "menaccount");
            return (Criteria) this;
        }

        public Criteria andMenaccountNotEqualTo(Integer value) {
            addCriterion("menAccount <>", value, "menaccount");
            return (Criteria) this;
        }

        public Criteria andMenaccountGreaterThan(Integer value) {
            addCriterion("menAccount >", value, "menaccount");
            return (Criteria) this;
        }

        public Criteria andMenaccountGreaterThanOrEqualTo(Integer value) {
            addCriterion("menAccount >=", value, "menaccount");
            return (Criteria) this;
        }

        public Criteria andMenaccountLessThan(Integer value) {
            addCriterion("menAccount <", value, "menaccount");
            return (Criteria) this;
        }

        public Criteria andMenaccountLessThanOrEqualTo(Integer value) {
            addCriterion("menAccount <=", value, "menaccount");
            return (Criteria) this;
        }

        public Criteria andMenaccountIn(List<Integer> values) {
            addCriterion("menAccount in", values, "menaccount");
            return (Criteria) this;
        }

        public Criteria andMenaccountNotIn(List<Integer> values) {
            addCriterion("menAccount not in", values, "menaccount");
            return (Criteria) this;
        }

        public Criteria andMenaccountBetween(Integer value1, Integer value2) {
            addCriterion("menAccount between", value1, value2, "menaccount");
            return (Criteria) this;
        }

        public Criteria andMenaccountNotBetween(Integer value1, Integer value2) {
            addCriterion("menAccount not between", value1, value2, "menaccount");
            return (Criteria) this;
        }

        public Criteria andDetailtimeIsNull() {
            addCriterion("detailTime is null");
            return (Criteria) this;
        }

        public Criteria andDetailtimeIsNotNull() {
            addCriterion("detailTime is not null");
            return (Criteria) this;
        }

        public Criteria andDetailtimeEqualTo(String value) {
            addCriterion("detailTime =", value, "detailtime");
            return (Criteria) this;
        }

        public Criteria andDetailtimeNotEqualTo(String value) {
            addCriterion("detailTime <>", value, "detailtime");
            return (Criteria) this;
        }

        public Criteria andDetailtimeGreaterThan(String value) {
            addCriterion("detailTime >", value, "detailtime");
            return (Criteria) this;
        }

        public Criteria andDetailtimeGreaterThanOrEqualTo(String value) {
            addCriterion("detailTime >=", value, "detailtime");
            return (Criteria) this;
        }

        public Criteria andDetailtimeLessThan(String value) {
            addCriterion("detailTime <", value, "detailtime");
            return (Criteria) this;
        }

        public Criteria andDetailtimeLessThanOrEqualTo(String value) {
            addCriterion("detailTime <=", value, "detailtime");
            return (Criteria) this;
        }

        public Criteria andDetailtimeLike(String value) {
            addCriterion("detailTime like", value, "detailtime");
            return (Criteria) this;
        }

        public Criteria andDetailtimeNotLike(String value) {
            addCriterion("detailTime not like", value, "detailtime");
            return (Criteria) this;
        }

        public Criteria andDetailtimeIn(List<String> values) {
            addCriterion("detailTime in", values, "detailtime");
            return (Criteria) this;
        }

        public Criteria andDetailtimeNotIn(List<String> values) {
            addCriterion("detailTime not in", values, "detailtime");
            return (Criteria) this;
        }

        public Criteria andDetailtimeBetween(String value1, String value2) {
            addCriterion("detailTime between", value1, value2, "detailtime");
            return (Criteria) this;
        }

        public Criteria andDetailtimeNotBetween(String value1, String value2) {
            addCriterion("detailTime not between", value1, value2, "detailtime");
            return (Criteria) this;
        }

        public Criteria andExpendtimeIsNull() {
            addCriterion("expendTime is null");
            return (Criteria) this;
        }

        public Criteria andExpendtimeIsNotNull() {
            addCriterion("expendTime is not null");
            return (Criteria) this;
        }

        public Criteria andExpendtimeEqualTo(String value) {
            addCriterion("expendTime =", value, "expendtime");
            return (Criteria) this;
        }

        public Criteria andExpendtimeNotEqualTo(String value) {
            addCriterion("expendTime <>", value, "expendtime");
            return (Criteria) this;
        }

        public Criteria andExpendtimeGreaterThan(String value) {
            addCriterion("expendTime >", value, "expendtime");
            return (Criteria) this;
        }

        public Criteria andExpendtimeGreaterThanOrEqualTo(String value) {
            addCriterion("expendTime >=", value, "expendtime");
            return (Criteria) this;
        }

        public Criteria andExpendtimeLessThan(String value) {
            addCriterion("expendTime <", value, "expendtime");
            return (Criteria) this;
        }

        public Criteria andExpendtimeLessThanOrEqualTo(String value) {
            addCriterion("expendTime <=", value, "expendtime");
            return (Criteria) this;
        }

        public Criteria andExpendtimeLike(String value) {
            addCriterion("expendTime like", value, "expendtime");
            return (Criteria) this;
        }

        public Criteria andExpendtimeNotLike(String value) {
            addCriterion("expendTime not like", value, "expendtime");
            return (Criteria) this;
        }

        public Criteria andExpendtimeIn(List<String> values) {
            addCriterion("expendTime in", values, "expendtime");
            return (Criteria) this;
        }

        public Criteria andExpendtimeNotIn(List<String> values) {
            addCriterion("expendTime not in", values, "expendtime");
            return (Criteria) this;
        }

        public Criteria andExpendtimeBetween(String value1, String value2) {
            addCriterion("expendTime between", value1, value2, "expendtime");
            return (Criteria) this;
        }

        public Criteria andExpendtimeNotBetween(String value1, String value2) {
            addCriterion("expendTime not between", value1, value2, "expendtime");
            return (Criteria) this;
        }

        public Criteria andServerinfoIsNull() {
            addCriterion("serverInfo is null");
            return (Criteria) this;
        }

        public Criteria andServerinfoIsNotNull() {
            addCriterion("serverInfo is not null");
            return (Criteria) this;
        }

        public Criteria andServerinfoEqualTo(String value) {
            addCriterion("serverInfo =", value, "serverinfo");
            return (Criteria) this;
        }

        public Criteria andServerinfoNotEqualTo(String value) {
            addCriterion("serverInfo <>", value, "serverinfo");
            return (Criteria) this;
        }

        public Criteria andServerinfoGreaterThan(String value) {
            addCriterion("serverInfo >", value, "serverinfo");
            return (Criteria) this;
        }

        public Criteria andServerinfoGreaterThanOrEqualTo(String value) {
            addCriterion("serverInfo >=", value, "serverinfo");
            return (Criteria) this;
        }

        public Criteria andServerinfoLessThan(String value) {
            addCriterion("serverInfo <", value, "serverinfo");
            return (Criteria) this;
        }

        public Criteria andServerinfoLessThanOrEqualTo(String value) {
            addCriterion("serverInfo <=", value, "serverinfo");
            return (Criteria) this;
        }

        public Criteria andServerinfoLike(String value) {
            addCriterion("serverInfo like", value, "serverinfo");
            return (Criteria) this;
        }

        public Criteria andServerinfoNotLike(String value) {
            addCriterion("serverInfo not like", value, "serverinfo");
            return (Criteria) this;
        }

        public Criteria andServerinfoIn(List<String> values) {
            addCriterion("serverInfo in", values, "serverinfo");
            return (Criteria) this;
        }

        public Criteria andServerinfoNotIn(List<String> values) {
            addCriterion("serverInfo not in", values, "serverinfo");
            return (Criteria) this;
        }

        public Criteria andServerinfoBetween(String value1, String value2) {
            addCriterion("serverInfo between", value1, value2, "serverinfo");
            return (Criteria) this;
        }

        public Criteria andServerinfoNotBetween(String value1, String value2) {
            addCriterion("serverInfo not between", value1, value2, "serverinfo");
            return (Criteria) this;
        }

        public Criteria andAreaIsNull() {
            addCriterion("area is null");
            return (Criteria) this;
        }

        public Criteria andAreaIsNotNull() {
            addCriterion("area is not null");
            return (Criteria) this;
        }

        public Criteria andAreaEqualTo(String value) {
            addCriterion("area =", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaNotEqualTo(String value) {
            addCriterion("area <>", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaGreaterThan(String value) {
            addCriterion("area >", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaGreaterThanOrEqualTo(String value) {
            addCriterion("area >=", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaLessThan(String value) {
            addCriterion("area <", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaLessThanOrEqualTo(String value) {
            addCriterion("area <=", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaLike(String value) {
            addCriterion("area like", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaNotLike(String value) {
            addCriterion("area not like", value, "area");
            return (Criteria) this;
        }

        public Criteria andAreaIn(List<String> values) {
            addCriterion("area in", values, "area");
            return (Criteria) this;
        }

        public Criteria andAreaNotIn(List<String> values) {
            addCriterion("area not in", values, "area");
            return (Criteria) this;
        }

        public Criteria andAreaBetween(String value1, String value2) {
            addCriterion("area between", value1, value2, "area");
            return (Criteria) this;
        }

        public Criteria andAreaNotBetween(String value1, String value2) {
            addCriterion("area not between", value1, value2, "area");
            return (Criteria) this;
        }

        public Criteria andStartpointIsNull() {
            addCriterion("startPoint is null");
            return (Criteria) this;
        }

        public Criteria andStartpointIsNotNull() {
            addCriterion("startPoint is not null");
            return (Criteria) this;
        }

        public Criteria andStartpointEqualTo(String value) {
            addCriterion("startPoint =", value, "startpoint");
            return (Criteria) this;
        }

        public Criteria andStartpointNotEqualTo(String value) {
            addCriterion("startPoint <>", value, "startpoint");
            return (Criteria) this;
        }

        public Criteria andStartpointGreaterThan(String value) {
            addCriterion("startPoint >", value, "startpoint");
            return (Criteria) this;
        }

        public Criteria andStartpointGreaterThanOrEqualTo(String value) {
            addCriterion("startPoint >=", value, "startpoint");
            return (Criteria) this;
        }

        public Criteria andStartpointLessThan(String value) {
            addCriterion("startPoint <", value, "startpoint");
            return (Criteria) this;
        }

        public Criteria andStartpointLessThanOrEqualTo(String value) {
            addCriterion("startPoint <=", value, "startpoint");
            return (Criteria) this;
        }

        public Criteria andStartpointLike(String value) {
            addCriterion("startPoint like", value, "startpoint");
            return (Criteria) this;
        }

        public Criteria andStartpointNotLike(String value) {
            addCriterion("startPoint not like", value, "startpoint");
            return (Criteria) this;
        }

        public Criteria andStartpointIn(List<String> values) {
            addCriterion("startPoint in", values, "startpoint");
            return (Criteria) this;
        }

        public Criteria andStartpointNotIn(List<String> values) {
            addCriterion("startPoint not in", values, "startpoint");
            return (Criteria) this;
        }

        public Criteria andStartpointBetween(String value1, String value2) {
            addCriterion("startPoint between", value1, value2, "startpoint");
            return (Criteria) this;
        }

        public Criteria andStartpointNotBetween(String value1, String value2) {
            addCriterion("startPoint not between", value1, value2, "startpoint");
            return (Criteria) this;
        }

        public Criteria andEndpointIsNull() {
            addCriterion("endPoint is null");
            return (Criteria) this;
        }

        public Criteria andEndpointIsNotNull() {
            addCriterion("endPoint is not null");
            return (Criteria) this;
        }

        public Criteria andEndpointEqualTo(String value) {
            addCriterion("endPoint =", value, "endpoint");
            return (Criteria) this;
        }

        public Criteria andEndpointNotEqualTo(String value) {
            addCriterion("endPoint <>", value, "endpoint");
            return (Criteria) this;
        }

        public Criteria andEndpointGreaterThan(String value) {
            addCriterion("endPoint >", value, "endpoint");
            return (Criteria) this;
        }

        public Criteria andEndpointGreaterThanOrEqualTo(String value) {
            addCriterion("endPoint >=", value, "endpoint");
            return (Criteria) this;
        }

        public Criteria andEndpointLessThan(String value) {
            addCriterion("endPoint <", value, "endpoint");
            return (Criteria) this;
        }

        public Criteria andEndpointLessThanOrEqualTo(String value) {
            addCriterion("endPoint <=", value, "endpoint");
            return (Criteria) this;
        }

        public Criteria andEndpointLike(String value) {
            addCriterion("endPoint like", value, "endpoint");
            return (Criteria) this;
        }

        public Criteria andEndpointNotLike(String value) {
            addCriterion("endPoint not like", value, "endpoint");
            return (Criteria) this;
        }

        public Criteria andEndpointIn(List<String> values) {
            addCriterion("endPoint in", values, "endpoint");
            return (Criteria) this;
        }

        public Criteria andEndpointNotIn(List<String> values) {
            addCriterion("endPoint not in", values, "endpoint");
            return (Criteria) this;
        }

        public Criteria andEndpointBetween(String value1, String value2) {
            addCriterion("endPoint between", value1, value2, "endpoint");
            return (Criteria) this;
        }

        public Criteria andEndpointNotBetween(String value1, String value2) {
            addCriterion("endPoint not between", value1, value2, "endpoint");
            return (Criteria) this;
        }

        public Criteria andSendtimeIsNull() {
            addCriterion("sendTime is null");
            return (Criteria) this;
        }

        public Criteria andSendtimeIsNotNull() {
            addCriterion("sendTime is not null");
            return (Criteria) this;
        }

        public Criteria andSendtimeEqualTo(String value) {
            addCriterion("sendTime =", value, "sendtime");
            return (Criteria) this;
        }

        public Criteria andSendtimeNotEqualTo(String value) {
            addCriterion("sendTime <>", value, "sendtime");
            return (Criteria) this;
        }

        public Criteria andSendtimeGreaterThan(String value) {
            addCriterion("sendTime >", value, "sendtime");
            return (Criteria) this;
        }

        public Criteria andSendtimeGreaterThanOrEqualTo(String value) {
            addCriterion("sendTime >=", value, "sendtime");
            return (Criteria) this;
        }

        public Criteria andSendtimeLessThan(String value) {
            addCriterion("sendTime <", value, "sendtime");
            return (Criteria) this;
        }

        public Criteria andSendtimeLessThanOrEqualTo(String value) {
            addCriterion("sendTime <=", value, "sendtime");
            return (Criteria) this;
        }

        public Criteria andSendtimeLike(String value) {
            addCriterion("sendTime like", value, "sendtime");
            return (Criteria) this;
        }

        public Criteria andSendtimeNotLike(String value) {
            addCriterion("sendTime not like", value, "sendtime");
            return (Criteria) this;
        }

        public Criteria andSendtimeIn(List<String> values) {
            addCriterion("sendTime in", values, "sendtime");
            return (Criteria) this;
        }

        public Criteria andSendtimeNotIn(List<String> values) {
            addCriterion("sendTime not in", values, "sendtime");
            return (Criteria) this;
        }

        public Criteria andSendtimeBetween(String value1, String value2) {
            addCriterion("sendTime between", value1, value2, "sendtime");
            return (Criteria) this;
        }

        public Criteria andSendtimeNotBetween(String value1, String value2) {
            addCriterion("sendTime not between", value1, value2, "sendtime");
            return (Criteria) this;
        }

        public Criteria andRepealtimeIsNull() {
            addCriterion("repealTime is null");
            return (Criteria) this;
        }

        public Criteria andRepealtimeIsNotNull() {
            addCriterion("repealTime is not null");
            return (Criteria) this;
        }

        public Criteria andRepealtimeEqualTo(String value) {
            addCriterion("repealTime =", value, "repealtime");
            return (Criteria) this;
        }

        public Criteria andRepealtimeNotEqualTo(String value) {
            addCriterion("repealTime <>", value, "repealtime");
            return (Criteria) this;
        }

        public Criteria andRepealtimeGreaterThan(String value) {
            addCriterion("repealTime >", value, "repealtime");
            return (Criteria) this;
        }

        public Criteria andRepealtimeGreaterThanOrEqualTo(String value) {
            addCriterion("repealTime >=", value, "repealtime");
            return (Criteria) this;
        }

        public Criteria andRepealtimeLessThan(String value) {
            addCriterion("repealTime <", value, "repealtime");
            return (Criteria) this;
        }

        public Criteria andRepealtimeLessThanOrEqualTo(String value) {
            addCriterion("repealTime <=", value, "repealtime");
            return (Criteria) this;
        }

        public Criteria andRepealtimeLike(String value) {
            addCriterion("repealTime like", value, "repealtime");
            return (Criteria) this;
        }

        public Criteria andRepealtimeNotLike(String value) {
            addCriterion("repealTime not like", value, "repealtime");
            return (Criteria) this;
        }

        public Criteria andRepealtimeIn(List<String> values) {
            addCriterion("repealTime in", values, "repealtime");
            return (Criteria) this;
        }

        public Criteria andRepealtimeNotIn(List<String> values) {
            addCriterion("repealTime not in", values, "repealtime");
            return (Criteria) this;
        }

        public Criteria andRepealtimeBetween(String value1, String value2) {
            addCriterion("repealTime between", value1, value2, "repealtime");
            return (Criteria) this;
        }

        public Criteria andRepealtimeNotBetween(String value1, String value2) {
            addCriterion("repealTime not between", value1, value2, "repealtime");
            return (Criteria) this;
        }

        public Criteria andRepealreasonIsNull() {
            addCriterion("repealReason is null");
            return (Criteria) this;
        }

        public Criteria andRepealreasonIsNotNull() {
            addCriterion("repealReason is not null");
            return (Criteria) this;
        }

        public Criteria andRepealreasonEqualTo(String value) {
            addCriterion("repealReason =", value, "repealreason");
            return (Criteria) this;
        }

        public Criteria andRepealreasonNotEqualTo(String value) {
            addCriterion("repealReason <>", value, "repealreason");
            return (Criteria) this;
        }

        public Criteria andRepealreasonGreaterThan(String value) {
            addCriterion("repealReason >", value, "repealreason");
            return (Criteria) this;
        }

        public Criteria andRepealreasonGreaterThanOrEqualTo(String value) {
            addCriterion("repealReason >=", value, "repealreason");
            return (Criteria) this;
        }

        public Criteria andRepealreasonLessThan(String value) {
            addCriterion("repealReason <", value, "repealreason");
            return (Criteria) this;
        }

        public Criteria andRepealreasonLessThanOrEqualTo(String value) {
            addCriterion("repealReason <=", value, "repealreason");
            return (Criteria) this;
        }

        public Criteria andRepealreasonLike(String value) {
            addCriterion("repealReason like", value, "repealreason");
            return (Criteria) this;
        }

        public Criteria andRepealreasonNotLike(String value) {
            addCriterion("repealReason not like", value, "repealreason");
            return (Criteria) this;
        }

        public Criteria andRepealreasonIn(List<String> values) {
            addCriterion("repealReason in", values, "repealreason");
            return (Criteria) this;
        }

        public Criteria andRepealreasonNotIn(List<String> values) {
            addCriterion("repealReason not in", values, "repealreason");
            return (Criteria) this;
        }

        public Criteria andRepealreasonBetween(String value1, String value2) {
            addCriterion("repealReason between", value1, value2, "repealreason");
            return (Criteria) this;
        }

        public Criteria andRepealreasonNotBetween(String value1, String value2) {
            addCriterion("repealReason not between", value1, value2, "repealreason");
            return (Criteria) this;
        }

        public Criteria andOrderstateIsNull() {
            addCriterion("orderState is null");
            return (Criteria) this;
        }

        public Criteria andOrderstateIsNotNull() {
            addCriterion("orderState is not null");
            return (Criteria) this;
        }

        public Criteria andOrderstateEqualTo(Integer value) {
            addCriterion("orderState =", value, "orderstate");
            return (Criteria) this;
        }

        public Criteria andOrderstateNotEqualTo(Integer value) {
            addCriterion("orderState <>", value, "orderstate");
            return (Criteria) this;
        }

        public Criteria andOrderstateGreaterThan(Integer value) {
            addCriterion("orderState >", value, "orderstate");
            return (Criteria) this;
        }

        public Criteria andOrderstateGreaterThanOrEqualTo(Integer value) {
            addCriterion("orderState >=", value, "orderstate");
            return (Criteria) this;
        }

        public Criteria andOrderstateLessThan(Integer value) {
            addCriterion("orderState <", value, "orderstate");
            return (Criteria) this;
        }

        public Criteria andOrderstateLessThanOrEqualTo(Integer value) {
            addCriterion("orderState <=", value, "orderstate");
            return (Criteria) this;
        }

        public Criteria andOrderstateIn(List<Integer> values) {
            addCriterion("orderState in", values, "orderstate");
            return (Criteria) this;
        }

        public Criteria andOrderstateNotIn(List<Integer> values) {
            addCriterion("orderState not in", values, "orderstate");
            return (Criteria) this;
        }

        public Criteria andOrderstateBetween(Integer value1, Integer value2) {
            addCriterion("orderState between", value1, value2, "orderstate");
            return (Criteria) this;
        }

        public Criteria andOrderstateNotBetween(Integer value1, Integer value2) {
            addCriterion("orderState not between", value1, value2, "orderstate");
            return (Criteria) this;
        }

        public Criteria andCallnameIsNull() {
            addCriterion("callName is null");
            return (Criteria) this;
        }

        public Criteria andCallnameIsNotNull() {
            addCriterion("callName is not null");
            return (Criteria) this;
        }

        public Criteria andCallnameEqualTo(String value) {
            addCriterion("callName =", value, "callname");
            return (Criteria) this;
        }

        public Criteria andCallnameNotEqualTo(String value) {
            addCriterion("callName <>", value, "callname");
            return (Criteria) this;
        }

        public Criteria andCallnameGreaterThan(String value) {
            addCriterion("callName >", value, "callname");
            return (Criteria) this;
        }

        public Criteria andCallnameGreaterThanOrEqualTo(String value) {
            addCriterion("callName >=", value, "callname");
            return (Criteria) this;
        }

        public Criteria andCallnameLessThan(String value) {
            addCriterion("callName <", value, "callname");
            return (Criteria) this;
        }

        public Criteria andCallnameLessThanOrEqualTo(String value) {
            addCriterion("callName <=", value, "callname");
            return (Criteria) this;
        }

        public Criteria andCallnameLike(String value) {
            addCriterion("callName like", value, "callname");
            return (Criteria) this;
        }

        public Criteria andCallnameNotLike(String value) {
            addCriterion("callName not like", value, "callname");
            return (Criteria) this;
        }

        public Criteria andCallnameIn(List<String> values) {
            addCriterion("callName in", values, "callname");
            return (Criteria) this;
        }

        public Criteria andCallnameNotIn(List<String> values) {
            addCriterion("callName not in", values, "callname");
            return (Criteria) this;
        }

        public Criteria andCallnameBetween(String value1, String value2) {
            addCriterion("callName between", value1, value2, "callname");
            return (Criteria) this;
        }

        public Criteria andCallnameNotBetween(String value1, String value2) {
            addCriterion("callName not between", value1, value2, "callname");
            return (Criteria) this;
        }

        public Criteria andCallphoneIsNull() {
            addCriterion("callPhone is null");
            return (Criteria) this;
        }

        public Criteria andCallphoneIsNotNull() {
            addCriterion("callPhone is not null");
            return (Criteria) this;
        }

        public Criteria andCallphoneEqualTo(String value) {
            addCriterion("callPhone =", value, "callphone");
            return (Criteria) this;
        }

        public Criteria andCallphoneNotEqualTo(String value) {
            addCriterion("callPhone <>", value, "callphone");
            return (Criteria) this;
        }

        public Criteria andCallphoneGreaterThan(String value) {
            addCriterion("callPhone >", value, "callphone");
            return (Criteria) this;
        }

        public Criteria andCallphoneGreaterThanOrEqualTo(String value) {
            addCriterion("callPhone >=", value, "callphone");
            return (Criteria) this;
        }

        public Criteria andCallphoneLessThan(String value) {
            addCriterion("callPhone <", value, "callphone");
            return (Criteria) this;
        }

        public Criteria andCallphoneLessThanOrEqualTo(String value) {
            addCriterion("callPhone <=", value, "callphone");
            return (Criteria) this;
        }

        public Criteria andCallphoneLike(String value) {
            addCriterion("callPhone like", value, "callphone");
            return (Criteria) this;
        }

        public Criteria andCallphoneNotLike(String value) {
            addCriterion("callPhone not like", value, "callphone");
            return (Criteria) this;
        }

        public Criteria andCallphoneIn(List<String> values) {
            addCriterion("callPhone in", values, "callphone");
            return (Criteria) this;
        }

        public Criteria andCallphoneNotIn(List<String> values) {
            addCriterion("callPhone not in", values, "callphone");
            return (Criteria) this;
        }

        public Criteria andCallphoneBetween(String value1, String value2) {
            addCriterion("callPhone between", value1, value2, "callphone");
            return (Criteria) this;
        }

        public Criteria andCallphoneNotBetween(String value1, String value2) {
            addCriterion("callPhone not between", value1, value2, "callphone");
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