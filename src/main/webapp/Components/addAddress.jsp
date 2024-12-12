<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .adress-form-content form .form-input, select {
        width: 100%!important;
    }
    .form-checkbox{
        display: flex;
        justify-content: space-between;
    }
    #form-check-input {
        width: 5px!important;
        height: 20px;
    }
</style>
<body>
<div class="row adress-form wrapper">
    <div class="col-md-8 mb-4">
        <div class="card mb-4">
            <div class="adress-form">
                <div class="adress-form-content">
                    <h2>
                        Địa chỉ nhận hàng <span id="adress-close">X Đóng</span>
                    </h2>
                    <form action="UserInfo" method="post" id="address-form">
                        <input type="hidden" name="pos" id="pos" value="">
                        <input type="hidden" name="action" value="addAddress">
                        <input type="hidden" name="menu" value="address_your">
                        <p style="padding: 0">Chọn đầy đủ địa chỉ nhận hàng để biết chính xác thời
                            gian giao</p>
                        <div class=" col-lg-12 col-sm-12 col-xs-12" >
                            <fieldset class="form-group" >
                                <input type="text" class="form-input select-field"
                                       value="" name="fullName" id="fullName"
                                       placeholder="Họ tên" required>
                            </fieldset>
                        </div>
                        <div class=" col-lg-12 col-sm-12 col-xs-12">
                            <fieldset class="form-group">
                                <input placeholder="Số điện thoại" type="text"
                                       pattern="\d+" class="form-input form-control-comment"
                                       name="PhoneNumber" required id="PhoneNumber"
                                >
                            </fieldset>
                        </div>
                        <div
                                class="group-country col-md-12 col-lg-12 col-sm-12 col-xs-12">
                            <fieldset
                                    class="form-group select-field select-field-provinces">
                                <select name="Province" value=""
                                        class="form-control add provinces" id="provinces"
                                        onchange="getDistricts()"></select>
                            </fieldset>
                            <fieldset class="form-group select-field">
                                <select name="District" class="form-control add districts"
                                        value="" id="districts" onchange="getWards()">
                                    <option value="" hidden="">Quận huyện</option>
                                </select>
                            </fieldset>
                            <fieldset class="form-group select-field">
                                <select name="Ward" class="form-control add wards"
                                        value="" id="wards">
                                    <option value="" hidden="">Phường xã</option>
                                </select>
                            </fieldset>
                        </div>
                        <div class=" col-lg-12 col-sm-12 col-xs-12">
                            <fieldset class="form-group">
                                <input class="description form-input" type="text" name="Description"
                                       placeholder="Số nhà tên đường (không bắt buộc)"
                                       style="margin: 0">
                            </fieldset>
                        </div>
                        <div class="d-flex justify-content-around align-items-center">
                            <div class="form-checkbox">
                                <input class="form-check-input" type="checkbox" value="1" name="default" id="default">
                                <label id="form-check-label" for="default"> Địa chỉ mặc định </label>
                            </div>
                            <button class="btn-hover btn btn-primary">Xác nhận</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
