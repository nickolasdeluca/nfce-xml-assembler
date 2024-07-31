# nfce-xml-assembler

Este projeto serve apenas como instrução de como modificar XMLs já gerados e adicionar as tags de autorização para *Notas Fiscais de Consumidor*, já que a SEFAZ não disponibiliza os downloads dos XMLs após a transmissão.

É **importante** ressaltar que os XMLs gerados por este projeto ainda tem seu `DigestValue` **inválido** e não devem ser disponibilizados ao consumidor, pois são, de certa forma, *falsificações*.

O XML gerado serve, porém, para questões contábeis, onde o XML em si não é importante e sim os dados que ele contém, como chave de acesso, protocolo, informações impostos, emitente e destinatário, sendo desnecessária a assinatura do documento.

Se esse é o seu caso de uso, este projeto vai lhe ajudar, se não, **NÃO RECOMENDO** a utilização do mesmo!

## Dependências

[FortesReport](https://github.com/fortesinformatica/fortesreport-ce)

[Projeto ACBr](https://projetoacbr.com.br/fontes/)
