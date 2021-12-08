var gridView;
var dataProvider;

RealGridJS.setRootContext("/resources");
dataProvider = new RealGridJS.LocalDataProvider();
gridView = new RealGridJS.GridView("realgrid");
gridView.setDataSource(dataProvider);

//새로운 DataColumn array 객체 생성
var columns = [
    {
        name: "col1",
        fieldName: "id",
        header : {
            text: "상품 ID"
        },
        width: 100
    },
    {
        name: "col2",
        fieldName: "itemName",
        header : {
            text: "상품명"
        },
        width: 100
    },
    {
        name: "col3",
        fieldName: "price",
        header : {
            text: "가격"
        },
        width: 100
    },
    {
        name: "col4",
        fieldName: "quantity",
        header : {
            text: "수량"
        },
        width: 100
    },
];

//setColumns()합수로 그리드에 반영
gridView.setColumns(columns);

//새로운 DataField 배열 객체 생성
var fields = [
    {
        fieldName: "id"
    },
    {
        fieldName: "itemName"
    },
    {
        fieldName: "price"
    },
    {
        fieldName: "quantity"
    },
];

//setFields()함수로 그리드에 반영
dataProvider.setFields(fields);

var data;

$.ajax({
    url: "/items/ajax",
    type: "GET",
    dataType: "json",
    error: function (error) {
        alert(error.status);
    }
})
    .done(function(response) {
        data = JSON.parse(JSON.stringify(response));

        var itemTypes = [];
        var set = new Set();
        var value;
        for(var i = 0; i < data.length; i++) {
            set.add(data[i].itemType);
        }
        itemTypes = Array.from(set);
        value = countItemTypes(itemTypes, data);

        setBarChart(itemTypes, value);
        dataProvider.setRows(data);
    });

gridView.onDataCellClicked = function (grid, index) {
    if ("itemName" === index.fieldName || "id" === index.fieldName) {
        location.href = "/items/" + grid.getValue(index.itemIndex, "id");
    }
};



function countItemTypes(itemTypes, data) {
    var countingNumber = [];
    for (var i = 0; i < itemTypes.length; i++) {
        var count = 0;
        for (var j = 0; j < data.length; j++) {
            if (itemTypes[i] === data[j].itemType) {
                count++;
            }
        }
        countingNumber.push(count);
    }
    return countingNumber;
}

function setBarChart(categories, value) {
    Highcharts.chart('container', {

        title: {
            text: 'Quantity'
        },
        xAxis: {
            categories: categories,
        },

        plotOptions: {
            series: {
                relativeXValue: true
            }
        },

        series: [{
            name: 'count',
            data: value,
            type: 'column'
        }]
    });
}

