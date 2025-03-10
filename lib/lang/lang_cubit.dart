import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:one_billon/shared/cubit/services.dart';
import 'package:one_billon/shared/enums/languageEventType.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangInitial());
  appLanguageFunc(LanguageEventEnums eventType){
    switch (eventType) {
      case LanguageEventEnums.InitialLanguge :
        if( sharedPreferences!.getString('lang') != null){
         if(sharedPreferences!.getString('lang') == 'ar'){
          emit(AppChangeLang(languageCode: 'ar'));
         }else{
          emit(AppChangeLang(languageCode: 'en'));

         }
        }
        break;
        case LanguageEventEnums.ArabicLanguage :
        sharedPreferences!.setString('lang', 'ar');
        emit(AppChangeLang(languageCode: 'ar'));
        break;
        case LanguageEventEnums.EnglishLanguage :
        sharedPreferences!.setString('lang', 'en');
        emit(AppChangeLang(languageCode: 'en'));

        
        break;
      default:
    }
  }
}
