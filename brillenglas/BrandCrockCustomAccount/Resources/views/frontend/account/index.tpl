{extends file="parent:frontend/index/index.tpl"}
{extends file='frontend/index/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start' }

{/block}

{block name="frontend_index_left_categories_my_account"}{/block}

{* Account Sidebar *}
{block name="frontend_index_left_categories"}
{/block}

{* Shop header *}
{block name='frontend_index_navigation' append}
	<div class="bctitle"><span>Ihr Konto</span></div>   
{/block}

{* Account Main Content *}
{block name="frontend_index_content"}
  

     <div id="brill_account" class="ihr-account">
	 <div class="bcleft_mainview row">
		  <div class="col">
				<div class="tabs">
				  <div class="tab">
					<input type="checkbox" id="chck1">
					<label class="tab-label" for="chck1">Meine Gläser</label>
					<div class="tab-content">
					  <table class="glas">
					     <tr>
							 <td>Dioptrie links:</td>
							 <td>1.5</td>
					     </tr>
					     <tr>
							 <td>Dioptrie rechts:</td>
							 <td>2.5 </td>
					     </tr>
					  </table>
					</div>
				  </div>
				  <div class="tab">
					<input type="checkbox" id="chck2">
					<label class="tab-label" for="chck2">Meine Bestellungen</label>
					<div class="tab-content" id="tab2">
						<table class="glas">
						
					    {foreach $sOpenOrders as $offerPosition}
					     <tr>
							 <td>{$offerPosition.datum|date_format:'%d-%m-%Y'}</td>
							 <td>
							 {assign var ="acount" value="{count($offerPosition.details)-1} "}
							 {foreach $offerPosition.details as $key => $article}
							 {if $key eq 0}
									 {$article.name}<br>
									 <div>
									 <span>Basispreis:</span>
									 <span> {if $article.price}
											{if $offerPosition.currency_position == "32"}
												{$offerPosition.currency_html} {$article.price} *
											{else}
												{$article.price} {$offerPosition.currency_html} *
											{/if}
										{else}
											{s name="OrderItemInfoFree"}{/s}
										{/if}</span><br>
									 <span>Aufpreis:</span>
									 <span>0&euro;</span>
									 </div><br>
									 <div><span>Gesamt:</span>
											<span>{if $article.amount}
												{if $offerPosition.currency_position == "32"}
													{$offerPosition.currency_html} {$article.amount}  *
												{else}
													{$article.amount} {$offerPosition.currency_html} *
												{/if}
											{else}
												{s name="OrderItemInfoFree"}{/s}
											{/if}</span>		
								 </div>
							 {elseif $key gt 0 && $key eq $acount}
								 {assign var="sn" value="#order"}
								  <a href="{url controller='account' action='orders'}">View</a>
								 {/if}
                             {/foreach}
                             </td>
					     </tr>
                        {/foreach}
                        </table>
                        {block name="frontend_account_orders_actions_paging"}
							<div class="account--paging panel--paging">
								{if $sPages.previous}
									<a href="{$sPages.previous}" class="btn paging--link paging--prev">
										<i class="icon--arrow-left"></i>
									</a>
								{/if}

								{foreach $sPages.numbers as $page}
									{if $page.markup}
										<a class="paging--link is--active">{$page.value}</a>
										{$sPage=$page.value}
									{else}
										<a href="{$page.link}" class="paging--link">{$page.value}</a>
									{/if}
								{/foreach}

								{if $sPages.next}
									<a href="{$sPages.next}" class="btn paging--link paging--next">
										<i class="icon--arrow-right"></i>
									</a>
								{/if}

								{block name='frontend_account_orders_actions_paging_count'}
									<div class="paging--display">
										{s name="ListingTextSite" namespace="frontend/listing/listing_actions"}{/s}
										<span class="is--bold">{if $sPage}{$sPage}{else}1{/if}</span>
										{s name="ListingTextFrom" namespace="frontend/listing/listing_actions"}{/s}
										<span class="is--bold">{$sNumberPages}</span>
									</div>
								{/block}
							</div>
						{/block}
					</div>
				  </div>
				  <div class="tab">
					<input type="checkbox" id="chck3">
					<label class="tab-label" for="chck3">Meine Daten</label>
					<div class="tab-content">
					  <div class="panel--body is--wide">
                            <p>
                                {$sUserData.additional.user.salutation|salutation}
                                {if {config name="displayprofiletitle"}}
                                    {$sUserData.additional.user.title|escapeHtml}<br/>
                                {/if}
                                {$sUserData.additional.user.firstname|escapeHtml} {$sUserData.additional.user.lastname|escapeHtml}<br />
                                {$sUserData.additional.user.email|escapeHtml}<br/>
                                {if $sUserData.additional.user.birthday}
                                    {$sUserData.additional.user.birthday|date:'dd.MM.y'}<br />
                                {/if}
							    {if $sUserData.billingaddress.additional_address_line1}<span class="address--additional-one">{$sUserData.billingaddress.additional_address_line1|escapeHtml}</span><br />{/if}
								{if $sUserData.billingaddress.additional_address_line2}<span class="address--additional-two">{$sUserData.billingaddress.additional_address_line2|escapeHtml}</span><br />{/if}
								{if {config name=showZipBeforeCity}}
									<span class="address--zipcode">{$sUserData.billingaddress.zipcode|escapeHtml}</span> <span class="address--city">{$sUserData.billingaddress.city|escapeHtml}</span>
								{else}
									<span class="address--city">{$sUserData.billingaddress.city|escapeHtml}</span> <span class="address--zipcode">{$sUserData.billingaddress.zipcode|escapeHtml}</span>
								{/if}<br />
								{if $sUserData.additional.state.statename}<span class="address--statename">{$sUserData.additional.state.statename|escapeHtml}</span><br />{/if}
								<span class="address--countryname">{$sUserData.additional.country.countryname|escapeHtml}</span>
                            </p>
                            {block name="frontend_account_index_info_actions"}
								<a href="{url controller=address action=edit id=$sUserData.additional.user.default_billing_address_id sTarget=account}"
                                   title="{s name='AccountLinkChangeBilling'}{/s}"
                                   class="bcbtn">
                                    Daten bearbeiten
                                </a>
							{/block}
                        </div>
					</div>
				  </div>
			</div>
	</div>
	</div>

    <div class="content account--content bccustom">

        {* Success messages *}
        {block name="frontend_account_index_success_messages"}
            {include file="frontend/account/success_messages.tpl"}
        {/block}

        {* Shipping error message *}
        {block name="frontend_account_index_shipping_country_error_message"}
            {if !$sUserData.shippingaddress.country.allowShipping}
                {include file="frontend/_includes/messages.tpl" type="error" content="{s name="AccountShippingCountryNotAllowed"}{/s}"}
            {/if}
        {/block}

        {* Optin successful *}
        {if $smarty.get.optinconfirmed && {config name=optinregister}}
            {s name="AccountOptinConfirmed" assign="snippetAccountOptinConfirmed"}{/s}
            {include file="frontend/_includes/messages.tpl" type="success" content=$snippetAccountOptinConfirmed}
        {/if}

        {* Error messages *}
        {block name="frontend_account_index_error_messages"}
            {if $sErrorMessages}
                <div class="account--error">
                    {include file="frontend/register/error_message.tpl" error_messages=$sErrorMessages}
                </div>
            {/if}
        {/block}

        {* Welcome text *}
        {block name="frontend_account_index_welcome"}
            <div class="account--welcome panel">
                {block name="frontend_account_index_welcome_headline"}
                    <h1 class="panel--title">{s name='AccountHeaderWelcome'}{/s},
                        {if {config name="displayprofiletitle"}}
                            {$sUserData.additional.user.title}
                        {/if}
                        {$sUserData.additional.user.firstname|escapeHtml}
                        {$sUserData.additional.user.lastname|escapeHtml}
                    </h1>
                {/block}

                {block name="frontend_account_index_welcome_content"}
                    <div class="panel--body is--wide">
                        <p>{s name='AccountHeaderInfo'}{/s}</p>
                    </div>
                {/block}
            </div>
        {/block}

        <div data-panel-auto-resizer="true" class="account-info--container">
            {* General user informations *}
            {block name="frontend_account_index_info"}
                <div class="account--info account--box panel has--border is--rounded">

                    {block name="frontend_account_index_info_headline"}
                        <h2 class="panel--title is--underline">{s name="AccountHeaderBasic"}{/s}</h2>
                    {/block}

                    {block name="frontend_account_index_info_content"}
                        <div class="panel--body is--wide">
                            <p>
                                {$sUserData.additional.user.salutation|salutation}
                                {if {config name="displayprofiletitle"}}
                                    {$sUserData.additional.user.title|escapeHtml}<br/>
                                {/if}
                                {$sUserData.additional.user.firstname|escapeHtml} {$sUserData.additional.user.lastname|escapeHtml}<br />
                                {if $sUserData.additional.user.birthday}
                                    {$sUserData.additional.user.birthday|date:'dd.MM.y'}<br />
                                {/if}
                                {$sUserData.additional.user.email|escapeHtml}
                            </p>
                        </div>
                    {/block}

                    {block name="frontend_account_index_info_actions"}
                        <div class="panel--actions is--wide">
                            <a href="{url controller=account action=profile}" title="{s name='AccountLinkChangeProfile'}{/s}" class="btn is--small">
                                {s name='AccountLinkChangeProfile'}{/s}
                            </a>
                        </div>
                    {/block}
                </div>
            {/block}

            {* Payment information *}
            {block name="frontend_account_index_payment_method"}
                <div class="account--payment account--box panel has--border is--rounded">

                    {block name="frontend_account_index_payment_method_headline"}
                        <h2 class="panel--title is--underline">{s name="AccountHeaderPayment"}{/s}</h2>
                    {/block}

                    {block name="frontend_account_index_payment_method_content"}
                        <div class="panel--body is--wide">
                            <p>
                                <strong>{$sUserData.additional.payment.description}</strong><br />

                                {if !$sUserData.additional.payment.esdactive && {config name="showEsd"}}
                                    {s name="AccountInfoInstantDownloads"}{/s}
                                {/if}
                            </p>
                        </div>
                    {/block}

                    {block name="frontend_account_index_payment_method_actions"}
                        {s name="AccountLinkChangePayment" assign="paymentMethodTitle"}{/s}

                        <div class="panel--actions is--wide">
                            <a href="{url controller='account' action='payment'}"
                               title="{$paymentMethodTitle|escape}"
                               class="btn is--small">
                                {s name='AccountLinkChangePayment'}{/s}
                            </a>
                        </div>
                    {/block}
                </div>
            {/block}
        </div>

        {block name="frontend_account_index_addresses"}
            <div data-panel-auto-resizer="true" class="account-address--container">
                {* Billing addresses *}
                {block name="frontend_account_index_primary_billing"}
                    <div class="account--billing account--box panel has--border is--rounded">

                        {block name="frontend_account_index_primary_billing_headline"}
                            <h2 class="panel--title is--underline">{s name="AccountHeaderPrimaryBilling"}{/s}</h2>
                        {/block}

                        {block name="frontend_account_index_primary_billing_content"}
                            <div class="panel--body is--wide">
                                {if $sUserData.billingaddress.company}
                                    <p>
                                        <span class="address--company">{$sUserData.billingaddress.company|escapeHtml}</span>{if $sUserData.billingaddress.department} - <span class="address--department">{$sUserData.billingaddress.department|escapeHtml}</span>{/if}
                                    </p>
                                {/if}
                                <p>
                                    <span class="address--salutation">{$sUserData.billingaddress.salutation|salutation|escapeHtml}</span>
                                    {if {config name="displayprofiletitle"}}
                                        <span class="address--title">{$sUserData.billingaddress.title|escapeHtml}</span><br/>
                                    {/if}
                                    <span class="address--firstname">{$sUserData.billingaddress.firstname|escapeHtml}</span> <span class="address--lastname">{$sUserData.billingaddress.lastname|escapeHtml}</span><br />
                                    <span class="address--street">{$sUserData.billingaddress.street|escapeHtml}</span><br />
                                    {if $sUserData.billingaddress.additional_address_line1}<span class="address--additional-one">{$sUserData.billingaddress.additional_address_line1|escapeHtml}</span><br />{/if}
                                    {if $sUserData.billingaddress.additional_address_line2}<span class="address--additional-two">{$sUserData.billingaddress.additional_address_line2|escapeHtml}</span><br />{/if}
                                    {if {config name=showZipBeforeCity}}
                                        <span class="address--zipcode">{$sUserData.billingaddress.zipcode|escapeHtml}</span> <span class="address--city">{$sUserData.billingaddress.city|escapeHtml}</span>
                                    {else}
                                        <span class="address--city">{$sUserData.billingaddress.city|escapeHtml}</span> <span class="address--zipcode">{$sUserData.billingaddress.zipcode|escapeHtml}</span>
                                    {/if}<br />
                                    {if $sUserData.additional.state.statename}<span class="address--statename">{$sUserData.additional.state.statename|escapeHtml}</span><br />{/if}
                                    <span class="address--countryname">{$sUserData.additional.country.countryname|escapeHtml}</span>
                                </p>
                            </div>
                        {/block}

                        {block name="frontend_account_index_primary_billing_actions"}
                            <div class="panel--actions is--wide">
                                <a href="{url controller=address action=edit id=$sUserData.additional.user.default_billing_address_id sTarget=account}"
                                   title="{s name='AccountLinkChangeBilling'}{/s}"
                                   class="btn">
                                    {s name="AccountLinkChangeBilling"}{/s}
                                </a>
                                <br/>
                                <a href="{url controller=address}"
                                   data-address-selection="true"
                                   data-setDefaultBillingAddress="1"
                                   data-id="{$sUserData.additional.user.default_billing_address_id}"
                                   title="{s name='AccountLinkChangeBilling'}{/s}">
                                    {s name="AccountLinkSelectBilling"}{/s}
                                </a>
                            </div>
                        {/block}
                    </div>
                {/block}

                {* Shipping addresses *}
                {block name="frontend_account_index_primary_shipping"}
                    <div class="account--shipping account--box panel has--border is--rounded">

                        {block name="frontend_account_index_primary_shipping_headline"}
                            <h2 class="panel--title is--underline">{s name="AccountHeaderPrimaryShipping"}{/s}</h2>
                        {/block}

                        {block name="frontend_account_index_primary_shipping_content"}
                            <div class="panel--body is--wide">
                                {if $activeBillingAddressId == $activeShippingAddressId}
                                    {block name="frontend_account_index_primary_shipping_content_equality_notice"}
                                        <div class="shipping--equal-info">
                                            {s name="AccountAddressEqualsBilling"}Equal to the billing address{/s}
                                        </div>
                                    {/block}
                                {else}
                                    {block name="frontend_account_index_primary_shipping_content_address"}
                                        {if $sUserData.shippingaddress.company}
                                            <p>
                                                <span class="address--company">{$sUserData.shippingaddress.company|escapeHtml}</span>{if $sUserData.shippingaddress.department} - <span class="address--department">{$sUserData.shippingaddress.department|escapeHtml}</span>{/if}
                                            </p>
                                        {/if}
                                        <p>
                                            <span class="address--salutation">{$sUserData.shippingaddress.salutation|salutation}</span>
                                            {if {config name="displayprofiletitle"}}
                                                <span class="address--title">{$sUserData.shippingaddress.title|escapeHtml}</span><br/>
                                            {/if}
                                            <span class="address--firstname">{$sUserData.shippingaddress.firstname|escapeHtml}</span> <span class="address--lastname">{$sUserData.shippingaddress.lastname|escapeHtml}</span><br />
                                            <span class="address--street">{$sUserData.shippingaddress.street|escapeHtml}</span><br />
                                            {if $sUserData.shippingaddress.additional_address_line1}<span class="address--additional-one">{$sUserData.shippingaddress.additional_address_line1|escapeHtml}</span><br />{/if}
                                            {if $sUserData.shippingaddress.additional_address_line2}<span class="address--additional-two">{$sUserData.shippingaddress.additional_address_line2|escapeHtml}</span><br />{/if}
                                            {if {config name=showZipBeforeCity}}
                                                <span class="address--zipcode">{$sUserData.shippingaddress.zipcode|escapeHtml}</span> <span class="address--city">{$sUserData.shippingaddress.city|escapeHtml}</span>
                                            {else}
                                                <span class="address--city">{$sUserData.shippingaddress.city|escapeHtml}</span> <span class="address--zipcode">{$sUserData.shippingaddress.zipcode|escapeHtml}</span>
                                            {/if}<br />
                                            {if $sUserData.additional.stateShipping.statename}<span class="address--statename">{$sUserData.additional.stateShipping.statename|escapeHtml}</span><br />{/if}
                                            <span class="address--countryname">{$sUserData.additional.countryShipping.countryname|escapeHtml}</span>
                                        </p>
                                    {/block}
                                {/if}
                            </div>
                        {/block}

                        {block name="frontend_account_index_primary_shipping_actions"}
                            {if $activeBillingAddressId == $activeShippingAddressId}
                                {block name="frontend_account_index_primary_shipping_choose_seperate_address"}
                                        <div class="panel--actions is--wide">
                                            <a href="{url controller=address}"
                                               class="btn choose-different-address"
                                               data-address-selection="true"
                                               data-setDefaultShippingAddress="1"
                                               data-id="{$sUserData.additional.user.default_shipping_address_id}"
                                               title="{s name="ConfirmAddressChooseDifferentShippingAddress" namespace="frontend/checkout/confirm"}{/s}">
                                                {s name="ConfirmAddressChooseDifferentShippingAddress" namespace="frontend/checkout/confirm"}{/s}
                                            </a>
                                        </div>
                                {/block}
                            {else}
                                {block name="frontend_account_index_primary_shipping_add_select_address"}
                                    <div class="panel--actions is--wide">
                                        <a href="{url controller=address action=edit id=$sUserData.additional.user.default_shipping_address_id sTarget=account}"
                                           title="{s name='AccountLinkChangeShipping'}{/s}"
                                           class="btn">
                                            {s name="AccountLinkChangeShipping"}{/s}
                                        </a>
                                        <br/>
                                        <a href="{url controller=address}"
                                           data-address-selection="true"
                                           data-setDefaultShippingAddress="1"
                                           data-id="{$sUserData.additional.user.default_shipping_address_id}"
                                           title="{s name='AccountLinkSelectShipping'}{/s}">
                                            {s name="AccountLinkSelectShipping"}{/s}
                                        </a>
                                    </div>
                                {/block}
                            {/if}
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}

        {* Newsletter settings *}
        {block name="frontend_account_index_newsletter_settings"}
            <div class="account--newsletter account--box panel has--border is--rounded newsletter">

                {block name="frontend_account_index_newsletter_settings_headline"}
                <h2 class="panel--title is--underline">{s name="AccountHeaderNewsletter"}{/s}</h2>
                {/block}

                {block name="frontend_account_index_newsletter_settings_content"}
                    <div class="panel--body is--wide">
                        <form name="frmRegister" method="post" action="{url action=saveNewsletter}">
                            <fieldset>
                                <input type="checkbox" name="newsletter" value="1" id="newsletter" data-auto-submit="true" {if $sUserData.additional.user.newsletter}checked="checked"{/if} />
                                <label for="newsletter">
                                    {s name="AccountLabelWantNewsletter"}{/s}
                                </label>
                            </fieldset>
                        </form>
                    </div>
                {/block}
            </div>
        {/block}

    </div>
{/block}
