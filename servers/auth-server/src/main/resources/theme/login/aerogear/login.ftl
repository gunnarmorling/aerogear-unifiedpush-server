<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${rb.loginTitle} UnifiedPush Server
    <#elseif section = "header">
        ${rb.loginTitle} <strong>UnifiedPush Server</strong>
    <#elseif section = "form">
        <#if realm.password>
            <form id="kc-form-login" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">${rb.usernameOrEmail}</label>
                    </div>

                    <div class="${properties.kcInputWrapperClass!}">
                        <input id="username" class="${properties.kcInputClass!}" name="username" value="${login.username!''}" type="text" autofocus />
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${rb.password}</label>
                    </div>

                    <div class="${properties.kcInputWrapperClass!}">
                        <input id="password" class="${properties.kcInputClass!}" name="password" type="password" />
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <#if realm.rememberMe>
                            <div class="checkbox">
                                <label>
                                    <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"> Remember Me
                                </label>
                            </div>
                        </#if>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span>${rb.loginForgot} <a href="${url.loginPasswordResetUrl}">${rb.password}</a>?</span>
                            </#if>
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <div class="${properties.kcFormButtonsWrapperClass!}">
                            <input class="btn btn-primary btn-lg" name="login" id="kc-login" type="submit" value="${rb.logIn}"/>
                            <input class="btn btn-default btn-lg" name="cancel" id="kc-cancel" type="submit" value="${rb.cancel}"/>
                        </div>
                     </div>
                </div>
            </form>
        <#elseif realm.social>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" class="zocial ${p.id}"> <span class="text">${p.name}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed>
            <div id="kc-registration">
                <span>${rb.noAccount} <a href="${url.registrationUrl}">${rb.register}</a></span>
            </div>
        </#if>

        <#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" class="zocial ${p.id}"> <span class="text">${p.name}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>