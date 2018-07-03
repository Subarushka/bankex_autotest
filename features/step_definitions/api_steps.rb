Then(/^Отправляю запрос для востановления пароля к почте "(.*)"$/) do |elm|
    body = "{
        \"captcha\":\"03ACgFB9uTM4r1BSeWGTt4b1x2Hsi0GU4sTTQNT-QV2QfNM7DILwQM0Y5utcgQIWSuFhZNSnMtGn2EjMBxsZXa7cAEBIyeTKRFHzhmkg-Vk3Ew7_8a7FRZxZOZp7MkNje3H_loE0oBz7ceopyKcs9EBQ7c9aYxg8mklX6b_joprBGA6TFjdVEszIDUQfJkEkHwOyI-G1gDpGK9i4nuoQET1CsiXA3eUfTabxbh6w1ej2zycljEb4H-i7_IdV10VKUzHHtPL6Cx_v_feGdkqeYzL-p1hdZV6iC_A9xmFisXEvHZfHALYOO3xJ-CRkFmrcjt9Bn64mJ3A7gDm065Ns2if3fcLKonIGypLUt4nRahlCL97GDGWbl5Pzo\",
        \"email\": \"#{elm}\",
        \"redirectUrl\": \"\"
    }"

    $response = HTTParty.post("https://sso-uat.bankexlab.com/api/v1/restorePassword", :body => body)

    puts $response.code.to_s
    puts $response.body.to_s

    $token = JSON.parse($response.body)["token"]
end