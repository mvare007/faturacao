
export default class Datatables {
  defaultOptions = {
    responsive: true,
    dom: 'Bfrtip',
    buttons: [
      {
        extend: 'copy',
        text: 'Copiar'
      },
      {
        extend: 'excel',
        text: 'Excel'
      },
      {
        extend: 'pdf',
        text: 'PDF'
      },
      {
        extend: 'print',
        text: 'Imprimir'
      }
    ],
    select: true,
    lengthMenu: [
      [10, 25, 50, -1],
      ['10 linhas', '25 linhas', '50 linhas', 'Todas']
    ],
    pageLength: 10,
    order: [
      [0, 'asc']
    ],
    language: {
      url: '//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese.json'
    }
  }
}
// $(document).ready(function () {
//   $("#example").dataTable({
//     language: {
//       sEmptyTable: "Nenhum registo encontrado",
//       sInfo: "A visualizar de _START_ até _END_ de _TOTAL_ registos",
//       sInfoEmpty: "A visualizar 0 até 0 de 0 registos",
//       sInfoFiltered: "(Filtrados de _MAX_ registros)",
//       sInfoPostFix: "",
//       sInfoThousands: ".",
//       sLengthMenu: "A visualizar _MENU_ resultados por página",
//       sLoadingRecords: "A Carregar...",
//       sProcessing: "A Processar...",
//       sZeroRecords: "Nenhum registo encontrado",
//       sSearch: "Pesquisar",
//       oPaginate: {
//         sNext: "Próximo",
//         sPrevious: "Anterior",
//         sFirst: "Primeiro",
//         sLast: "Último",
//       },
//       oAria: {
//         sSortAscending: ": Ordenar colunas de forma ascendente",
//         sSortDescending: ": Ordenar colunas de forma descendente",
//       },
//       select: {
//         rows: {
//           _: "Linhas %d seleccionadas",
//           0: "Nenhuma linha selecionada",
//           1: "1 linha seleccionada ",
//         },
//       },
//     },
//   });
// });
