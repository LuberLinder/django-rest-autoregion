from rest_framework import generics
from api.models import Code
from api.serializers import CodeSerializer


class CodeList(generics.ListAPIView):
    serializer_class = CodeSerializer
    
    def get_queryset(self):
        country_id = self.request.query_params.get('country_id', 1)
        code = self.request.query_params.get('code', '').upper()
        lang_id = self.request.query_params.get('lang_id', 1)
        queryset = Code.objects.filter(country_id=country_id, code__startswith=code, lang_id=lang_id)
        return queryset

    
class CodeDetailView(generics.RetrieveAPIView):
    queryset = Code.objects.all()
    serializer_class = CodeSerializer

