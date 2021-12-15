*** Settings ***
Library     SeleniumLibrary
Resource   common.robot

*** Variable ***
${login_btn}    dt_login_button
${preloader}    //*[@id="dt_core_header_acc-info-preloader"]
${pwd_field}    //*[@type="password"]
${email_field}      name=email
${login_oauth_btn}  //*[text()="Log in"]
${acc_switch}   //*[@id="dt_core_account-info_acc-info"]
${demo_deriv}     //*[text()="Demo"]
${demo_acc}     //*[contains(@id,"dt_VRTC")]
${symbol_menu}  //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div
${symbol_list}  //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div/div[2]/div/div/div[2]/div[2]/div/div[2]
${vol10_index}  //*[text()="Volatility 10 (1s) Index"]
${buy_disable}  //*[@id="trade_container"]/div[4]/div/div/fieldset[1]/div
${top_buy}      //*[@id="dt_purchase_call_button"]
${bottom_buy}    //*[@id="dt_purchase_put_button"]
${aud_usd}  //*[text()="AUD/USD"]
${trade_type}   //*[@id="dt_contract_dropdown"]
${trade_menu}       //*[@data-testid="contract_wrapper"]
${higher_lower}     //*[@id="dt_contract_high_low_item"]
${day_dur}  //*[@id="dt_simple_duration_datepicker"]/div/div[1]/input
${payout}   //*[@id="dc_payout_toggle_item"]
${payout_input}     //*[@id="dt_amount_input"]
${pos_tab}      //*[@id="dt_positions_drawer"]
${barrier}  //*[@id="dt_barrier_1_input"]
${vol50}    //*[text()="Volatility 50 Index"]
${multiplier}   //*[@id="dt_contract_multiplier_item"]
${take_profit}  //*[text()="Take profit"]
${stop_loss}    //*[text()="Stop loss"]
${deal_cancel}      //*[text()="Deal cancellation"]
${multi_select}     //*[@id="dropdown-display"]
${multi_20}     //*[@id="20"]
${multi_40}     //*[@id="40"]
${multi_60}     //*[@id="60"]
${multi_100}     //*[@id="100"]
${multi_200}     //*[@id="200"]
${add_USD}  //*[@id="dt_amount_input_add"]
${cancel_fee}   //*[@id="dt_purchase_multup_price"]/div/div[2]/span
${acc_settings}     //*[@id="dt_core_header_acc-info-container"]/div[2]/div/div/span/a
${api_tab}      //*[@id="dc_api-token_link"]
${api_timeline}     //*[@class="da-api-token__timeline"]

${api_create}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/button
${token_input}  //*[@name="token_name"]
${read_scope}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]
${trade_scope}  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[2]
${pay_scope}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[3]
${admin_scope}  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[4]
${info_scope}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[5]
${first_token}  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]
${second_token}     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[2]
${third_token}      //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[3]
${fourth_token}      //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[4]
${x_btn}    //*[@id="app_contents"]/div/div/div/div/div[1]/div/div[2]
${char_warning}     //*[text()="Only letters, numbers, and underscores are allowed."]
${delete1}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/button
${yes_delete1}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/div/button[2]
${no_delete1}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]/td[5]/div/button[1]
${copy_icon}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]/td[2]/div/div/div/div
${copied}   //*[text()="Token copied!"]

*** Test Cases ***
Open Deriv
    Login   ${my_email}     ${my_pwd}
    Go to Demo Account
    Go to API Page
    No scopes and create API
    1 scope and create API
    2 scope and create API
    5 scope and create API
    Empty token name
    Enter a char
    Enter 32 chars
    Enter special chars
    Enter duplicate token name
    Delete and confirm
    Delete and cancel
    Copy Token
    Close Settings

#    Buy Rise contract
#    Buy Lower contract
#    Test Barrier
#    Check No Payout
#    Check Take Profit
#    Check Stop Loss
#    Check Deal Cancel
#    Check Multi Value
#    Deal Cancel changes with Stake
