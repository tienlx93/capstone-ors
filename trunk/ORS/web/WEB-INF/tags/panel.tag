<%@ tag pageEncoding="UTF-8" body-content="scriptless" %>
<%@ attribute name="badge" required="true" %>
<%@ attribute name="name" required="true" %>
<%@ attribute name="url" required="true" %>
<%@ attribute name="css" required="false" %>
<%@ attribute name="icon" required="true" %>
<div class="col-lg-3 col-md-6">
    <a href="${url}">
        <div class="panel ${css}" style="min-height: 130px;">
            <div class="panel-heading" style="padding-bottom: 0">
                <div class="row">
                    <div class="col-xs-5">
                        <i class="fa ${icon} fa-4x"></i>
                    </div>
                    <div class="col-xs-7 text-right">
                        <div class="huge">${badge}</div>
                        <div>${name}</div>
                    </div>
                </div>
            </div>
        </div>
    </a>
</div>