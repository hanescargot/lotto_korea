import 'package:flutter/material.dart';

import '../../common/value/value.dart';

/// Flutter code sample for [PaginatedDataTable].

class MyDataSource extends DataTableSource {
  static const List<int> _displayIndexToRawIndex = <int>[0, 2, 3, 4, 5];

  late List<List<Comparable<Object>>> sortedData;
  void setData(List<List<Comparable<Object>>> rawData, int sortColumn,
      bool sortAscending) {
    sortedData = rawData.toList()
      ..sort((List<Comparable<Object>> a, List<Comparable<Object>> b) {
        final Comparable<Object> cellA = a[_displayIndexToRawIndex[sortColumn]];
        final Comparable<Object> cellB = b[_displayIndexToRawIndex[sortColumn]];
        return cellA.compareTo(cellB) * (sortAscending ? 1 : -1);
      });
    notifyListeners();
  }

  @override
  int get rowCount => sortedData.length;

  static DataCell cellFor(Object data) {
    String value;
    if (data is DateTime) {
      value =
      '${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}';
    } else {
      value = data.toString();
    }
    return DataCell(Text(value));
  }

  @override
  DataRow? getRow(int index) {
    return DataRow(
      key: UniqueKey(),
      cells: <DataCell>[
        cellFor(
            '${sortedData[index][0]}회'),
        cellFor(sortedData[index][1]),
        cellFor(sortedData[index][2]),
        cellFor(sortedData[index][3]),
        cellFor(sortedData[index][4]),

      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  MyDataSource dataSource = MyDataSource()..setData(episodes, 0, true);

  int _columnIndex = 0;
  bool _columnAscending = true;

  void _sort(int columnIndex, bool ascending) {
    setState(() {
      _columnIndex = columnIndex;
      _columnAscending = ascending;
      dataSource.setData(episodes, _columnIndex, _columnAscending);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      key: Key("Lotto"),
      sortColumnIndex: _columnIndex,
      sortAscending: _columnAscending,
      columns: <DataColumn>[
        DataColumn(
          label: const Text('회차'),
          onSort: _sort,
        ),
        DataColumn(
          label: const Text('등수'),
          onSort: _sort,
        ),
        DataColumn(
          label: const Text('당첨금'),
          onSort: _sort,
        ),
        DataColumn(
          label: const Text('당첨번호'),
          onSort: _sort,
        ),
        DataColumn(
          label: const Text('날짜'),
          onSort: _sort,
        ),
      ],
      source: dataSource,
    );
  }
}


