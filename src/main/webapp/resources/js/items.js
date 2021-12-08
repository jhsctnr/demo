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

// 비동기 통신 성공 시 그리드, 차트 호출
$.ajax({
    url: "/items/ajax",
    type: "GET",
    dataType: "json",
    error: function (error) {
        alert(error.status);
    }
})
    .done(function(response) {
        var data = JSON.parse(JSON.stringify(response));
        setBarChart(data);
        dataProvider.setRows(data);
        setHiChart(dataProvider);
    });

//클릭 이벤트 페이지 이동
gridView.onDataCellClicked = function (grid, index) {
    if ("itemName" === index.fieldName || "id" === index.fieldName) {
        location.href = "/items/" + grid.getValue(index.itemIndex, "id");
    }
};

//차트 그리는 메서드
function setBarChart(data) {

    //아이템 타입을 찾는다.
    var itemTypes = [];
    var set = new Set();

    for(var i = 0; i < data.length; i++) {
        set.add(data[i].itemType);
    }
    itemTypes = Array.from(set);

    //아이템 타입 별 개수를 구한다.
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

    //차트를 그린다.
    Highcharts.chart('container', {

        title: {
            text: '수량'
        },
        xAxis: {
            categories: itemTypes,
        },
        yAxis:{
            title: {
                text: '개수(EA)',
            }
        },

        plotOptions: {
            series: {
                relativeXValue: true,
                label: false,
            }
        },

        series: [{
            showInLegend: false,
            name: '개수',
            data: countingNumber,
            type: 'column'
        }]
    });
}

function setHiChart(provider) {
    var categories = provider.getFieldValues("itemName");
    var quantity = provider.getFieldValues("quantity").map(x => Number(x));

    Highcharts.chart('container1', {
        title: {
            text: '제품 수량'
        },
        xAxis: {
            categories: categories,
            crosshair: true,
        },
        yAxis:[{
            title: {
                text: '개수 (EA)',
            },
            labels: {
                format: '{value} EA'
            }
        }],
        tooltip: {
            shared: true
        },
        legend: {
            enabled: false
        },
        series: [{
            // showInLegend: false,
            name: 'Quantity',
            data: quantity,
            tooltip: {
                valueSuffix: " EA"
            }
        }],
        chart: {
            type: 'column'
        }
    });
}

