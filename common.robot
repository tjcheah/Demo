*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Keywords ***
Login
    [arguments]     ${email}    ${pw}
    Open Browser    https://app.deriv.com   chrome
    set window size     1280    1020
    reload page
    wait until page does not contain element   ${preloader}   60
    wait until page contains element    ${login_btn}    30
    Click Element   ${login_btn}
    wait until page contains element    ${pwd_field}    40
    Input Text      ${email_field}      ${email}
    Input Text      ${pwd_field}       ${pw}
    Click Element   ${login_oauth_btn}

Go to Demo Account

    wait until page does not contain element    ${preloader}   60
    wait until page contains element   ${acc_switch}    30
    Click Element   ${acc_switch}
    wait until page contains element   ${demo_deriv}    15
    Click Element   ${demo_deriv}
    Click Element   ${demo_acc}

Buy Rise contract
    reload page
    wait until page does not contain element    ${preloader}   60
    wait until element is visible  ${symbol_menu}    30
    click element   ${symbol_menu}
    wait until element is visible  ${symbol_list}    30
    click element   ${vol10_index}
    wait until page does not contain element  ${buy_disable}    60
    sleep   5
    wait until element is visible   ${top_buy}      50
    click element   ${top_buy}
    wait until element is visible   ${pos_tab}      20

Buy Lower contract
    wait until element is visible  ${symbol_menu}    30
    click element   ${symbol_menu}
    wait until element is visible  ${symbol_list}    30
    click element   ${aud_usd}
    wait until page does not contain element  ${buy_disable}    30
    sleep   5
    click element   ${trade_type}
    wait until element is visible   ${trade_menu}   15
    click element   ${higher_lower}
    press keys  ${day_dur}  CTRL+a+BACKSPACE
    input text  ${day_dur}  2
    click element   ${payout}
    click element   ${payout_input}
    press keys   ${payout_input}     CTRL+a+BACKSPACE
    input text  ${payout_input}  15.50
    sleep   5
    wait until element is visible   ${bottom_buy}      50
    click element   ${bottom_buy}

Test Barrier
    wait until element is visible   ${bottom_buy}      50
    sleep   5
    press keys  ${barrier}      CTRL+a+BACKSPACE
    input text  ${barrier}      -0.23
    press keys   ${payout_input}     CTRL+a+BACKSPACE
    input text  ${payout_input}  10
    wait until page contains element  //*[text()="Contracts more than 24 hours in duration would need an absolute barrier."]     20

Check No Payout
    wait until element is visible  ${symbol_menu}    30
    click element   ${symbol_menu}
    wait until element is visible  ${symbol_list}    30
    click element   ${vol50}
    wait until page does not contain element  ${buy_disable}    30
    sleep   5
    click element   ${trade_type}
    wait until element is visible   ${trade_menu}   15
    sleep   1
    click element   ${multiplier}
    wait until page does not contain element    ${preloader}   60
    wait until page does not contain   Payout   10

Check Take Profit
    wait until page contains element   ${take_profit}   10
    click element   ${take_profit}
    sleep   1
    click element   ${take_profit}

Check Stop Loss
    wait until page contains element   ${stop_loss}     10
    click element   ${stop_loss}
    sleep   1
    click element   ${stop_loss}

Check Deal Cancel
    wait until page contains element   ${deal_cancel}   10
    click element   ${deal_cancel}
    sleep   1
    click element   ${deal_cancel}

Check Multi Value
    click element   ${multi_select}
    wait until page contains element    ${multi_20}     10
    wait until page contains element    ${multi_40}     10
    wait until page contains element    ${multi_60}     10
    wait until page contains element    ${multi_100}    10
    wait until page contains element    ${multi_200}    10
    click element   ${multi_select}

Deal Cancel changes with Stake
    wait until page contains element   ${deal_cancel}   10
    click element   ${deal_cancel}
    sleep   1
    wait until page contains element    ${cancel_fee}   15
    ${fee_text}=   get text   ${cancel_fee}
    Log To Console  ${fee_text}
    click element   ${add_USD}
    wait until page contains element    ${cancel_fee}   15
    ${2fee_text}=   get text   ${cancel_fee}
    Log To Console  ${2fee_text}
    Should Be True      ${2fee_text.replace(" USD","")} > ${fee_text.replace(" USD","")}

Go to API Page
    reload page
    wait until page does not contain element    ${preloader}   60
    click element   ${acc_settings}
    wait until element is visible   ${api_tab}     40
    sleep   1
    click element   ${api_tab}
    wait until page contains element     ${api_timeline}     60

No scopes and create API
    element should be disabled  ${api_create}

1 scope and create API
    input text  ${token_input}  testToken
    click element   ${read_scope}
    element should be enabled   ${api_create}
    click element   ${api_create}
    wait until page contains element    ${first_token}      40

2 scope and create API
    sleep   1
    input text  ${token_input}  testToken2
    click element   ${read_scope}
    click element   ${trade_scope}
    wait until element is visible   ${api_create}       40
    element should be enabled   ${api_create}
    click element   ${api_create}
    wait until page contains element    ${second_token}     40

5 scope and create API
    sleep   1
    input text  ${token_input}  testToken3
    click element   ${read_scope}
    click element   ${trade_scope}
    click element   ${pay_scope}
    click element   ${admin_scope}
    click element   ${info_scope}
    element should be enabled   ${api_create}
    sleep   1
    click element   ${api_create}
    wait until page contains element    ${third_token}      40

Empty token name
    click element   ${read_scope}
    press keys  ${token_input}  CTRL+a+BACKSPACE
    element should be disabled   ${api_create}

Enter a char
    input text  ${token_input}  b
    sleep   1
    element should be disabled   ${api_create}

Enter 32 chars
    press keys  ${token_input}  CTRL+a+BACKSPACE
    input text  ${token_input}  basdsadasfdfdsgsadgfgreagewgreaee
    sleep   1
    element should be disabled   ${api_create}

Enter special chars
    press keys  ${token_input}  CTRL+a+BACKSPACE
    input text  ${token_input}  @!#$%^&*()
    sleep   1
    element should be disabled   ${api_create}
    wait until page contains element    ${char_warning}

Enter duplicate token name
    sleep   1
    press keys  ${token_input}  CTRL+a+BACKSPACE
    input text  ${token_input}  testToken
    click element   ${read_scope}
    element should be enabled   ${api_create}
    click element   ${api_create}
    wait until page contains element    ${fourth_token}      40

Delete and confirm
    sleep   1
    click element   ${delete1}
    click element   ${yes_delete1}
    wait until page does not contain element    ${fourth_token}     40

Delete and cancel
    sleep   1
    click element   ${delete1}
    click element   ${no_delete1}
    wait until page contains element    ${third_token}  40

Copy Token
    sleep   1
    click element   ${copy_icon}
    wait until page contains element    ${copied}   20

Close Settings
    click element   ${x_btn}

#    Close Browser