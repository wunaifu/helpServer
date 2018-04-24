package com.helpserver.pojo;

import java.util.ArrayList;
import java.util.List;

public class OrderinfoExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public OrderinfoExample() {
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

        public Criteria andMoneyamountIsNull() {
            addCriterion("moneyAmount is null");
            return (Criteria) this;
        }

        public Criteria andMoneyamountIsNotNull() {
            addCriterion("moneyAmount is not null");
            return (Criteria) this;
        }

        public Criteria andMoneyamountEqualTo(Integer value) {
            addCriterion("moneyAmount =", value, "moneyamount");
            return (Criteria) this;
        }

        public Criteria andMoneyamountNotEqualTo(Integer value) {
            addCriterion("moneyAmount <>", value, "moneyamount");
            return (Criteria) this;
        }

        public Criteria andMoneyamountGreaterThan(Integer value) {
            addCriterion("moneyAmount >", value, "moneyamount");
            return (Criteria) this;
        }

        public Criteria andMoneyamountGreaterThanOrEqualTo(Integer value) {
            addCriterion("moneyAmount >=", value, "moneyamount");
            return (Criteria) this;
        }

        public Criteria andMoneyamountLessThan(Integer value) {
            addCriterion("moneyAmount <", value, "moneyamount");
            return (Criteria) this;
        }

        public Criteria andMoneyamountLessThanOrEqualTo(Integer value) {
            addCriterion("moneyAmount <=", value, "moneyamount");
            return (Criteria) this;
        }

        public Criteria andMoneyamountIn(List<Integer> values) {
            addCriterion("moneyAmount in", values, "moneyamount");
            return (Criteria) this;
        }

        public Criteria andMoneyamountNotIn(List<Integer> values) {
            addCriterion("moneyAmount not in", values, "moneyamount");
            return (Criteria) this;
        }

        public Criteria andMoneyamountBetween(Integer value1, Integer value2) {
            addCriterion("moneyAmount between", value1, value2, "moneyamount");
            return (Criteria) this;
        }

        public Criteria andMoneyamountNotBetween(Integer value1, Integer value2) {
            addCriterion("moneyAmount not between", value1, value2, "moneyamount");
            return (Criteria) this;
        }

        public Criteria andFoodnameIsNull() {
            addCriterion("foodName is null");
            return (Criteria) this;
        }

        public Criteria andFoodnameIsNotNull() {
            addCriterion("foodName is not null");
            return (Criteria) this;
        }

        public Criteria andFoodnameEqualTo(String value) {
            addCriterion("foodName =", value, "foodname");
            return (Criteria) this;
        }

        public Criteria andFoodnameNotEqualTo(String value) {
            addCriterion("foodName <>", value, "foodname");
            return (Criteria) this;
        }

        public Criteria andFoodnameGreaterThan(String value) {
            addCriterion("foodName >", value, "foodname");
            return (Criteria) this;
        }

        public Criteria andFoodnameGreaterThanOrEqualTo(String value) {
            addCriterion("foodName >=", value, "foodname");
            return (Criteria) this;
        }

        public Criteria andFoodnameLessThan(String value) {
            addCriterion("foodName <", value, "foodname");
            return (Criteria) this;
        }

        public Criteria andFoodnameLessThanOrEqualTo(String value) {
            addCriterion("foodName <=", value, "foodname");
            return (Criteria) this;
        }

        public Criteria andFoodnameLike(String value) {
            addCriterion("foodName like", value, "foodname");
            return (Criteria) this;
        }

        public Criteria andFoodnameNotLike(String value) {
            addCriterion("foodName not like", value, "foodname");
            return (Criteria) this;
        }

        public Criteria andFoodnameIn(List<String> values) {
            addCriterion("foodName in", values, "foodname");
            return (Criteria) this;
        }

        public Criteria andFoodnameNotIn(List<String> values) {
            addCriterion("foodName not in", values, "foodname");
            return (Criteria) this;
        }

        public Criteria andFoodnameBetween(String value1, String value2) {
            addCriterion("foodName between", value1, value2, "foodname");
            return (Criteria) this;
        }

        public Criteria andFoodnameNotBetween(String value1, String value2) {
            addCriterion("foodName not between", value1, value2, "foodname");
            return (Criteria) this;
        }

        public Criteria andStarttimeIsNull() {
            addCriterion("startTime is null");
            return (Criteria) this;
        }

        public Criteria andStarttimeIsNotNull() {
            addCriterion("startTime is not null");
            return (Criteria) this;
        }

        public Criteria andStarttimeEqualTo(String value) {
            addCriterion("startTime =", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeNotEqualTo(String value) {
            addCriterion("startTime <>", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeGreaterThan(String value) {
            addCriterion("startTime >", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeGreaterThanOrEqualTo(String value) {
            addCriterion("startTime >=", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeLessThan(String value) {
            addCriterion("startTime <", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeLessThanOrEqualTo(String value) {
            addCriterion("startTime <=", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeLike(String value) {
            addCriterion("startTime like", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeNotLike(String value) {
            addCriterion("startTime not like", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeIn(List<String> values) {
            addCriterion("startTime in", values, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeNotIn(List<String> values) {
            addCriterion("startTime not in", values, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeBetween(String value1, String value2) {
            addCriterion("startTime between", value1, value2, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeNotBetween(String value1, String value2) {
            addCriterion("startTime not between", value1, value2, "starttime");
            return (Criteria) this;
        }

        public Criteria andEndtimeIsNull() {
            addCriterion("endTime is null");
            return (Criteria) this;
        }

        public Criteria andEndtimeIsNotNull() {
            addCriterion("endTime is not null");
            return (Criteria) this;
        }

        public Criteria andEndtimeEqualTo(String value) {
            addCriterion("endTime =", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotEqualTo(String value) {
            addCriterion("endTime <>", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeGreaterThan(String value) {
            addCriterion("endTime >", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeGreaterThanOrEqualTo(String value) {
            addCriterion("endTime >=", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeLessThan(String value) {
            addCriterion("endTime <", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeLessThanOrEqualTo(String value) {
            addCriterion("endTime <=", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeLike(String value) {
            addCriterion("endTime like", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotLike(String value) {
            addCriterion("endTime not like", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeIn(List<String> values) {
            addCriterion("endTime in", values, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotIn(List<String> values) {
            addCriterion("endTime not in", values, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeBetween(String value1, String value2) {
            addCriterion("endTime between", value1, value2, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotBetween(String value1, String value2) {
            addCriterion("endTime not between", value1, value2, "endtime");
            return (Criteria) this;
        }

        public Criteria andOrderdetailIsNull() {
            addCriterion("orderDetail is null");
            return (Criteria) this;
        }

        public Criteria andOrderdetailIsNotNull() {
            addCriterion("orderDetail is not null");
            return (Criteria) this;
        }

        public Criteria andOrderdetailEqualTo(String value) {
            addCriterion("orderDetail =", value, "orderdetail");
            return (Criteria) this;
        }

        public Criteria andOrderdetailNotEqualTo(String value) {
            addCriterion("orderDetail <>", value, "orderdetail");
            return (Criteria) this;
        }

        public Criteria andOrderdetailGreaterThan(String value) {
            addCriterion("orderDetail >", value, "orderdetail");
            return (Criteria) this;
        }

        public Criteria andOrderdetailGreaterThanOrEqualTo(String value) {
            addCriterion("orderDetail >=", value, "orderdetail");
            return (Criteria) this;
        }

        public Criteria andOrderdetailLessThan(String value) {
            addCriterion("orderDetail <", value, "orderdetail");
            return (Criteria) this;
        }

        public Criteria andOrderdetailLessThanOrEqualTo(String value) {
            addCriterion("orderDetail <=", value, "orderdetail");
            return (Criteria) this;
        }

        public Criteria andOrderdetailLike(String value) {
            addCriterion("orderDetail like", value, "orderdetail");
            return (Criteria) this;
        }

        public Criteria andOrderdetailNotLike(String value) {
            addCriterion("orderDetail not like", value, "orderdetail");
            return (Criteria) this;
        }

        public Criteria andOrderdetailIn(List<String> values) {
            addCriterion("orderDetail in", values, "orderdetail");
            return (Criteria) this;
        }

        public Criteria andOrderdetailNotIn(List<String> values) {
            addCriterion("orderDetail not in", values, "orderdetail");
            return (Criteria) this;
        }

        public Criteria andOrderdetailBetween(String value1, String value2) {
            addCriterion("orderDetail between", value1, value2, "orderdetail");
            return (Criteria) this;
        }

        public Criteria andOrderdetailNotBetween(String value1, String value2) {
            addCriterion("orderDetail not between", value1, value2, "orderdetail");
            return (Criteria) this;
        }

        public Criteria andCityIsNull() {
            addCriterion("city is null");
            return (Criteria) this;
        }

        public Criteria andCityIsNotNull() {
            addCriterion("city is not null");
            return (Criteria) this;
        }

        public Criteria andCityEqualTo(String value) {
            addCriterion("city =", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotEqualTo(String value) {
            addCriterion("city <>", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityGreaterThan(String value) {
            addCriterion("city >", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityGreaterThanOrEqualTo(String value) {
            addCriterion("city >=", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityLessThan(String value) {
            addCriterion("city <", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityLessThanOrEqualTo(String value) {
            addCriterion("city <=", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityLike(String value) {
            addCriterion("city like", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotLike(String value) {
            addCriterion("city not like", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityIn(List<String> values) {
            addCriterion("city in", values, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotIn(List<String> values) {
            addCriterion("city not in", values, "city");
            return (Criteria) this;
        }

        public Criteria andCityBetween(String value1, String value2) {
            addCriterion("city between", value1, value2, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotBetween(String value1, String value2) {
            addCriterion("city not between", value1, value2, "city");
            return (Criteria) this;
        }

        public Criteria andAddressIsNull() {
            addCriterion("address is null");
            return (Criteria) this;
        }

        public Criteria andAddressIsNotNull() {
            addCriterion("address is not null");
            return (Criteria) this;
        }

        public Criteria andAddressEqualTo(String value) {
            addCriterion("address =", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotEqualTo(String value) {
            addCriterion("address <>", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThan(String value) {
            addCriterion("address >", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThanOrEqualTo(String value) {
            addCriterion("address >=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThan(String value) {
            addCriterion("address <", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThanOrEqualTo(String value) {
            addCriterion("address <=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLike(String value) {
            addCriterion("address like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotLike(String value) {
            addCriterion("address not like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressIn(List<String> values) {
            addCriterion("address in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotIn(List<String> values) {
            addCriterion("address not in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressBetween(String value1, String value2) {
            addCriterion("address between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotBetween(String value1, String value2) {
            addCriterion("address not between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andPointinfoIsNull() {
            addCriterion("pointInfo is null");
            return (Criteria) this;
        }

        public Criteria andPointinfoIsNotNull() {
            addCriterion("pointInfo is not null");
            return (Criteria) this;
        }

        public Criteria andPointinfoEqualTo(String value) {
            addCriterion("pointInfo =", value, "pointinfo");
            return (Criteria) this;
        }

        public Criteria andPointinfoNotEqualTo(String value) {
            addCriterion("pointInfo <>", value, "pointinfo");
            return (Criteria) this;
        }

        public Criteria andPointinfoGreaterThan(String value) {
            addCriterion("pointInfo >", value, "pointinfo");
            return (Criteria) this;
        }

        public Criteria andPointinfoGreaterThanOrEqualTo(String value) {
            addCriterion("pointInfo >=", value, "pointinfo");
            return (Criteria) this;
        }

        public Criteria andPointinfoLessThan(String value) {
            addCriterion("pointInfo <", value, "pointinfo");
            return (Criteria) this;
        }

        public Criteria andPointinfoLessThanOrEqualTo(String value) {
            addCriterion("pointInfo <=", value, "pointinfo");
            return (Criteria) this;
        }

        public Criteria andPointinfoLike(String value) {
            addCriterion("pointInfo like", value, "pointinfo");
            return (Criteria) this;
        }

        public Criteria andPointinfoNotLike(String value) {
            addCriterion("pointInfo not like", value, "pointinfo");
            return (Criteria) this;
        }

        public Criteria andPointinfoIn(List<String> values) {
            addCriterion("pointInfo in", values, "pointinfo");
            return (Criteria) this;
        }

        public Criteria andPointinfoNotIn(List<String> values) {
            addCriterion("pointInfo not in", values, "pointinfo");
            return (Criteria) this;
        }

        public Criteria andPointinfoBetween(String value1, String value2) {
            addCriterion("pointInfo between", value1, value2, "pointinfo");
            return (Criteria) this;
        }

        public Criteria andPointinfoNotBetween(String value1, String value2) {
            addCriterion("pointInfo not between", value1, value2, "pointinfo");
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

        public Criteria andSeeamountIsNull() {
            addCriterion("seeAmount is null");
            return (Criteria) this;
        }

        public Criteria andSeeamountIsNotNull() {
            addCriterion("seeAmount is not null");
            return (Criteria) this;
        }

        public Criteria andSeeamountEqualTo(Integer value) {
            addCriterion("seeAmount =", value, "seeamount");
            return (Criteria) this;
        }

        public Criteria andSeeamountNotEqualTo(Integer value) {
            addCriterion("seeAmount <>", value, "seeamount");
            return (Criteria) this;
        }

        public Criteria andSeeamountGreaterThan(Integer value) {
            addCriterion("seeAmount >", value, "seeamount");
            return (Criteria) this;
        }

        public Criteria andSeeamountGreaterThanOrEqualTo(Integer value) {
            addCriterion("seeAmount >=", value, "seeamount");
            return (Criteria) this;
        }

        public Criteria andSeeamountLessThan(Integer value) {
            addCriterion("seeAmount <", value, "seeamount");
            return (Criteria) this;
        }

        public Criteria andSeeamountLessThanOrEqualTo(Integer value) {
            addCriterion("seeAmount <=", value, "seeamount");
            return (Criteria) this;
        }

        public Criteria andSeeamountIn(List<Integer> values) {
            addCriterion("seeAmount in", values, "seeamount");
            return (Criteria) this;
        }

        public Criteria andSeeamountNotIn(List<Integer> values) {
            addCriterion("seeAmount not in", values, "seeamount");
            return (Criteria) this;
        }

        public Criteria andSeeamountBetween(Integer value1, Integer value2) {
            addCriterion("seeAmount between", value1, value2, "seeamount");
            return (Criteria) this;
        }

        public Criteria andSeeamountNotBetween(Integer value1, Integer value2) {
            addCriterion("seeAmount not between", value1, value2, "seeamount");
            return (Criteria) this;
        }

        public Criteria andPictureIsNull() {
            addCriterion("picture is null");
            return (Criteria) this;
        }

        public Criteria andPictureIsNotNull() {
            addCriterion("picture is not null");
            return (Criteria) this;
        }

        public Criteria andPictureEqualTo(String value) {
            addCriterion("picture =", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureNotEqualTo(String value) {
            addCriterion("picture <>", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureGreaterThan(String value) {
            addCriterion("picture >", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureGreaterThanOrEqualTo(String value) {
            addCriterion("picture >=", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureLessThan(String value) {
            addCriterion("picture <", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureLessThanOrEqualTo(String value) {
            addCriterion("picture <=", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureLike(String value) {
            addCriterion("picture like", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureNotLike(String value) {
            addCriterion("picture not like", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureIn(List<String> values) {
            addCriterion("picture in", values, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureNotIn(List<String> values) {
            addCriterion("picture not in", values, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureBetween(String value1, String value2) {
            addCriterion("picture between", value1, value2, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureNotBetween(String value1, String value2) {
            addCriterion("picture not between", value1, value2, "picture");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeIsNull() {
            addCriterion("updateTime is null");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeIsNotNull() {
            addCriterion("updateTime is not null");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeEqualTo(String value) {
            addCriterion("updateTime =", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeNotEqualTo(String value) {
            addCriterion("updateTime <>", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeGreaterThan(String value) {
            addCriterion("updateTime >", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeGreaterThanOrEqualTo(String value) {
            addCriterion("updateTime >=", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeLessThan(String value) {
            addCriterion("updateTime <", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeLessThanOrEqualTo(String value) {
            addCriterion("updateTime <=", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeLike(String value) {
            addCriterion("updateTime like", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeNotLike(String value) {
            addCriterion("updateTime not like", value, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeIn(List<String> values) {
            addCriterion("updateTime in", values, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeNotIn(List<String> values) {
            addCriterion("updateTime not in", values, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeBetween(String value1, String value2) {
            addCriterion("updateTime between", value1, value2, "updatetime");
            return (Criteria) this;
        }

        public Criteria andUpdatetimeNotBetween(String value1, String value2) {
            addCriterion("updateTime not between", value1, value2, "updatetime");
            return (Criteria) this;
        }

        public Criteria andLngIsNull() {
            addCriterion("lng is null");
            return (Criteria) this;
        }

        public Criteria andLngIsNotNull() {
            addCriterion("lng is not null");
            return (Criteria) this;
        }

        public Criteria andLngEqualTo(String value) {
            addCriterion("lng =", value, "lng");
            return (Criteria) this;
        }

        public Criteria andLngNotEqualTo(String value) {
            addCriterion("lng <>", value, "lng");
            return (Criteria) this;
        }

        public Criteria andLngGreaterThan(String value) {
            addCriterion("lng >", value, "lng");
            return (Criteria) this;
        }

        public Criteria andLngGreaterThanOrEqualTo(String value) {
            addCriterion("lng >=", value, "lng");
            return (Criteria) this;
        }

        public Criteria andLngLessThan(String value) {
            addCriterion("lng <", value, "lng");
            return (Criteria) this;
        }

        public Criteria andLngLessThanOrEqualTo(String value) {
            addCriterion("lng <=", value, "lng");
            return (Criteria) this;
        }

        public Criteria andLngLike(String value) {
            addCriterion("lng like", value, "lng");
            return (Criteria) this;
        }

        public Criteria andLngNotLike(String value) {
            addCriterion("lng not like", value, "lng");
            return (Criteria) this;
        }

        public Criteria andLngIn(List<String> values) {
            addCriterion("lng in", values, "lng");
            return (Criteria) this;
        }

        public Criteria andLngNotIn(List<String> values) {
            addCriterion("lng not in", values, "lng");
            return (Criteria) this;
        }

        public Criteria andLngBetween(String value1, String value2) {
            addCriterion("lng between", value1, value2, "lng");
            return (Criteria) this;
        }

        public Criteria andLngNotBetween(String value1, String value2) {
            addCriterion("lng not between", value1, value2, "lng");
            return (Criteria) this;
        }

        public Criteria andLatIsNull() {
            addCriterion("lat is null");
            return (Criteria) this;
        }

        public Criteria andLatIsNotNull() {
            addCriterion("lat is not null");
            return (Criteria) this;
        }

        public Criteria andLatEqualTo(String value) {
            addCriterion("lat =", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatNotEqualTo(String value) {
            addCriterion("lat <>", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatGreaterThan(String value) {
            addCriterion("lat >", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatGreaterThanOrEqualTo(String value) {
            addCriterion("lat >=", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatLessThan(String value) {
            addCriterion("lat <", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatLessThanOrEqualTo(String value) {
            addCriterion("lat <=", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatLike(String value) {
            addCriterion("lat like", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatNotLike(String value) {
            addCriterion("lat not like", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatIn(List<String> values) {
            addCriterion("lat in", values, "lat");
            return (Criteria) this;
        }

        public Criteria andLatNotIn(List<String> values) {
            addCriterion("lat not in", values, "lat");
            return (Criteria) this;
        }

        public Criteria andLatBetween(String value1, String value2) {
            addCriterion("lat between", value1, value2, "lat");
            return (Criteria) this;
        }

        public Criteria andLatNotBetween(String value1, String value2) {
            addCriterion("lat not between", value1, value2, "lat");
            return (Criteria) this;
        }

        public Criteria andAmountIsNull() {
            addCriterion("amount is null");
            return (Criteria) this;
        }

        public Criteria andAmountIsNotNull() {
            addCriterion("amount is not null");
            return (Criteria) this;
        }

        public Criteria andAmountEqualTo(Integer value) {
            addCriterion("amount =", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotEqualTo(Integer value) {
            addCriterion("amount <>", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountGreaterThan(Integer value) {
            addCriterion("amount >", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountGreaterThanOrEqualTo(Integer value) {
            addCriterion("amount >=", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLessThan(Integer value) {
            addCriterion("amount <", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLessThanOrEqualTo(Integer value) {
            addCriterion("amount <=", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountIn(List<Integer> values) {
            addCriterion("amount in", values, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotIn(List<Integer> values) {
            addCriterion("amount not in", values, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountBetween(Integer value1, Integer value2) {
            addCriterion("amount between", value1, value2, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotBetween(Integer value1, Integer value2) {
            addCriterion("amount not between", value1, value2, "amount");
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