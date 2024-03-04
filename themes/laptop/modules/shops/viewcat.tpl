<!-- BEGIN: main -->
<div class="viewcat shops-cat-page shops-cat-page-{MODULE_NAME}" id="category">
    <div class="page-header">
        <h1>{CAT_NAME}</h1>

        <!-- BEGIN: displays -->
        <div class="form-group s-cat-fillter">
            <span>Sắp xếp theo: </span>
            <select name="sort" id="sort" class="form-control d-inline-block" onchange="nv_chang_price();">
                <!-- BEGIN: sorts -->
                <option value="{key}" {se}>{value}</option>
                <!-- END: sorts -->
            </select>
        </div>
        <!-- END: displays -->


    </div>
    <div id="shops-content">
        {CONTENT}
    </div>

    <!-- BEGIN: viewdescriptionhtml -->
    <div class="bodyhtml-description-cate margin-bottom">
        {DESCRIPTIONHTML}
    </div>
    <!-- END: viewdescriptionhtml -->
</div>
<!-- END: main -->