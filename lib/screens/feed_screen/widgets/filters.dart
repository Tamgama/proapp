import 'package:flutter/material.dart';

class FilterPanel extends StatefulWidget {
  final Function(Map<String, dynamic>) onFilterChanged;

  FilterPanel({required this.onFilterChanged});

  @override
  _FilterPanelState createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
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
  String _selectedEquipment = 'Indiferente';
  List<String> _selectedFeatures = [];

  final List<String> _districts = [
    'Murcia Norte',
    'Murcia Centro',
    'Espinardo'
  ];
  final List<String> _neighborhoods = [
    'Vistabella',
    'El Carmen',
    'Joven Futura',
    'Vistalegre'
  ];
  final List<String> _propertyTypes = ['Apartamento', 'Casa', 'Dúplex'];
  final List<String> _conditions = ['Nuevo', 'A reformar', 'Bueno'];
  final List<String> _equipment = [
    'Indiferente',
    'Cocina equipada',
    'Amueblado'
  ];
  final List<String> _features = [
    'Garaje',
    'Jardín',
    'Piscina',
    'Terraza',
    'Trastero',
    'Accesibilidad',
    'Aire acondicionado'
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
          _buildSectionTitle('Precio'),
          _buildPriceRange(),
          _buildDivider(),
          _buildSectionTitle('Localización'),
          SizedBox(height: 8.0),
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
          _buildDivider(),
          _buildSectionTitle('Vivienda'),
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
          _buildDropdown('Equipamiento', _equipment, _selectedEquipment,
              (String? value) {
            setState(() {
              _selectedEquipment = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDivider(),
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
              List.generate(5, (index) => (index + 1).toString()),
              _selectedBathrooms.toString(), (String? value) {
            setState(() {
              _selectedBathrooms = int.parse(value!);
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
          _buildCheckbox('Acepta mascotas', _acceptPets, (bool? value) {
            setState(() {
              _hasElevator = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDivider(),
          _buildCheckboxList(),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _onFilterChanged();
              },
              child: Text('Aplicar filtros'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildPriceRange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${_minPrice.toStringAsFixed(0)}€'),
            Text('${_maxPrice.toStringAsFixed(0)}€'),
          ],
        ),
        RangeSlider(
          values: RangeValues(_minPrice, _maxPrice),
          min: 0,
          max: 1000000,
          divisions: 100,
          labels: RangeLabels(
            _minPrice.toStringAsFixed(0),
            _maxPrice.toStringAsFixed(0),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _minPrice = values.start;
              _maxPrice = values.end;
              _onFilterChanged();
            });
          },
        ),
      ],
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
            fontSize: 14,
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

  Widget _buildCheckboxList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Características adicionales',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        ..._features.map((feature) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(feature),
              Checkbox(
                value: _selectedFeatures.contains(feature),
                onChanged: (bool? checked) {
                  setState(() {
                    if (checked == true) {
                      _selectedFeatures.add(feature);
                    } else {
                      _selectedFeatures.remove(feature);
                    }
                    _onFilterChanged();
                  });
                },
              ),
            ],
          );
        }).toList(),
      ],
    );
  }

  void _onFilterChanged() {
    widget.onFilterChanged({
      'priceRange': [_minPrice, _maxPrice],
      'district': _selectedDistrict,
      'neighborhood': _selectedNeighborhood,
      'rooms': _selectedRooms,
      'bathrooms': _selectedBathrooms,
      'elevator': _hasElevator,
      'features': _selectedFeatures,
      'propertyType': _selectedPropertyType,
      'condition': _selectedCondition,
      'equipment': _selectedEquipment,
    });
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.black54,
      height: 20,
    );
  }
}
