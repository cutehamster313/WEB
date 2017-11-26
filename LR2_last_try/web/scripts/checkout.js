let isPickup;
let placemarks = [];

$(function () {
    ymaps.ready(initMap);
    showPickup();
    $('#choose_shop_list').val("-1");
    $('#input_address_delivery').val("");
});

function initMap() {
    let myMap = new ymaps.Map('map', {
        center: [59.964213, 30.312013],
        zoom: 10
    });

    for (let obj of document.getElementsByClassName("shopId")) {
        let shopId = obj.innerText;
        let coorX = Number.parseFloat($("#x" + shopId).text());
        let coorY = Number.parseFloat($("#y" + shopId).text());

        let mark = new ymaps.Placemark([coorX, coorY], {
            balloonContent: shopId + ". " + $("#name" + shopId).text()
        }, {
            preset: 'islands#icon',
            iconColor: '#0095b6'
        });

        mark.events.add("click", function (e) {
            $("#choose_shop_list").val(e.get('target').properties._data.balloonContent.split(".")[0]);
            checkButtonInPickup();
        });

        myMap.geoObjects.add(mark);
        placemarks.push({
            id: shopId,
            placemark: mark
        });
    }
}

function showDelivery() {
    setMode(false);
    $('#delivery').css('display', 'flex');
    $('#pickup').css('display', 'none');
}

function showPickup() {
    setMode(true);
    $('#delivery').css('display', 'none');
    $('#pickup').css('display', 'flex');
}

function changedList() {
    let shopId = document.getElementById("choose_shop_list").value;
    checkButtonInPickup();
    for (let mark of placemarks) {
        if (mark.id === shopId) {
            mark.placemark.balloon.open();
            return;
        }
    }
}

function buyTickets() {
    if (isPickup) {
        let shopId = document.getElementById("choose_shop_list").value;
        $.ajax({
            url: 'Checkout',
            type: 'POST',
            data: {"isPickup": isPickup, "shopId": shopId},
            success: function () {
                location.href = 'Profile';
            }
        });
    } else {
        $.ajax({
            url: 'Checkout',
            type: 'POST',
            data: {"isPickup": isPickup, "address": $('#input_address_delivery').val()},
            success: function () {
                location.href = 'Profile';
            }
        });
    }
}

function setMode(pickup) {
    isPickup = pickup;
    if (pickup) {
        checkButtonInPickup();
    } else {
        checkButtonInDelivery();
    }
}

function checkButtonInPickup() {
    if (document.getElementById("choose_shop_list").value === "-1") {
        $('#order_buy_btn').css("display", "none")
    } else {
        $('#order_buy_btn').css("display", "block")
    }
}

function checkButtonInDelivery() {

    if ($('#input_address_delivery').val().length > 0) {
        $("#order_buy_btn").css("display", "block");
    } else {
        $("#order_buy_btn").css("display", "none");
    }
}