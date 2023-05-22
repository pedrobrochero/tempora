# Uncomment line below if you're using FVM (Flutter version management)
prefix := fvm

gen:
	$(prefix) flutter packages pub run build_runner build --delete-conflicting-outputs

watch:
	$(prefix) flutter packages pub run build_runner watch --delete-conflicting-outputs
	
clean:
	$(prefix) flutter clean
	$(prefix) flutter pub get
	$(prefix) flutter packages pub run build_runner build --delete-conflicting-outputs

init:
	$(prefix) flutter packages pub add auto_route
	$(prefix) flutter packages pub add dartz
	$(prefix) flutter packages pub add equatable
	$(prefix) flutter packages pub add flutter_bloc
	$(prefix) flutter packages pub add freezed_annotation
	$(prefix) flutter packages pub add get_it
	$(prefix) flutter packages pub add intl
	$(prefix) flutter packages pub add package_info_plus
	$(prefix) flutter packages pub add url_launcher
	$(prefix) flutter packages pub add --dev auto_route_generator
	$(prefix) flutter packages pub add --dev build_runner
	$(prefix) flutter packages pub add --dev flutter_launcher_icons
	$(prefix) flutter packages pub add --dev freezed
	$(prefix) flutter packages pub add --dev json_serializable
	$(prefix) flutter packages pub add --dev logger

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	