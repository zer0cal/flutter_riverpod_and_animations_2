class CounterModel {
  CounterModel(this._value);
  
  int _value;
  get value => _value;
  set value(v) => _value = v;
}