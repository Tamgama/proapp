import 'package:flutter/material.dart';

class FilterColumn extends StatefulWidget {
  final Function(Map<String, dynamic>) onFilterChanged;

  FilterColumn({required this.onFilterChanged});

  @override
  _FilterColumnState createState() => _FilterColumnState();
}

class _FilterColumnState extends State<FilterColumn> {
  double _minPrice = 0;
  double _maxPrice = 1000000;
  String _selectedDistrict = '';
  String _selectedNeighborhood = '';
  int _selectedRooms = 1;
  int _selectedBathrooms = 1;
  bool _acceptPets = false;
  bool _hasElevator = false;
  String _selectedPropertyType = 'Apartamento';
  String _selectedCondition = 'Nuevo';
  List<String> _selectedFeatures = [];

  final List<String> _districts = ['Distrito 1', 'Distrito 2', 'Distrito 3'];
  final List<String> _neighborhoods = ['Barrio 1', 'Barrio 2', 'Barrio 3'];
  final List<String> _propertyTypes = ['Apartamento', 'Casa', 'Dúplex'];
  final List<String> _conditions = ['Nuevo', 'A reformar', 'Bueno'];
  final List<String> _features = [
    'Garaje',
    'Jardín',
    'Piscina',
    'Terraza',
    'Trastero'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filtros',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Precio',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          RangeSlider(
            values: RangeValues(_minPrice, _maxPrice),
            min: 0,
            max: 1000000,
            divisions: 100,
            labels: RangeLabels(
              _minPrice.toString(),
              _maxPrice.toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _minPrice = values.start;
                _maxPrice = values.end;
                _onFilterChanged();
              });
            },
          ),
          SizedBox(height: 8),
          _buildDropdown('Distrito', _districts, _selectedDistrict,
              (String? value) {
            setState(() {
              _selectedDistrict = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown('Barrio', _neighborhoods, _selectedNeighborhood,
              (String? value) {
            setState(() {
              _selectedNeighborhood = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown(
              'Habitaciones',
              List.generate(10, (index) => (index + 1).toString()),
              _selectedRooms.toString(), (String? value) {
            setState(() {
              _selectedRooms = int.parse(value!);
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown(
              'Baños',
              List.generate(10, (index) => (index + 1).toString()),
              _selectedBathrooms.toString(), (String? value) {
            setState(() {
              _selectedBathrooms = int.parse(value!);
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildCheckbox('Acepta mascotas', _acceptPets, (bool? value) {
            setState(() {
              _acceptPets = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildCheckbox('Ascensor', _hasElevator, (bool? value) {
            setState(() {
              _hasElevator = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown(
              'Tipo de vivienda', _propertyTypes, _selectedPropertyType,
              (String? value) {
            setState(() {
              _selectedPropertyType = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown('Estado', _conditions, _selectedCondition,
              (String? value) {
            setState(() {
              _selectedCondition = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          Text(
            'Características',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ..._features
              .map((feature) =>
                  _buildCheckbox(feature, _selectedFeatures.contains(feature),
                      (bool? value) {
                    setState(() {
                      if (value!) {
                        _selectedFeatures.add(feature);
                      } else {
                        _selectedFeatures.remove(feature);
                      }
                      _onFilterChanged();
                    });
                  }))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildDropdown(String title, List<String> options, String value,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        DropdownButton<String>(
          value: value.isEmpty ? null : value,
          hint: Text('Seleccione $title'),
          isExpanded: true,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildCheckbox(
      String title, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }

  void _onFilterChanged() {
    widget.onFilterChanged({
      'minPrice': _minPrice,
      'maxPrice': _maxPrice,
      'district': _selectedDistrict,
      'neighborhood': _selectedNeighborhood,
      'rooms': _selectedRooms,
      'bathrooms': _selectedBathrooms,
      'acceptPets': _acceptPets,
      'hasElevator': _hasElevator,
      'propertyType': _selectedPropertyType,
      'condition': _selectedCondition,
      'features': _selectedFeatures,
    });
  }
}
