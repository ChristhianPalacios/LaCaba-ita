$(document).ready(function () {
    $("btnDelete").click(function () {
        var idp = $(this).parent().find("idp").val();
        swal({
            title: "¿Estas Seguro de Eliminar?",
            text: "Once deleted, you will not be able to recover this imaginary file!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
                .then((willDelete) => {
                    if (willDelete) {
                        eliminar(idp);
                        swal("Poof! Your imaginary file has been deleted!", {
                            icon: "success",
                        }).then((willDelete)=>{
                            if (willDelete) {
                                parent.location.href="ServletProd?op=Delete";
                            }
                        });
                    } else {
                        swal("Registro No Eliminado");
                    }
                });
        
    });
    function eliminar(idp) {
        var url = "ServletProd?op=Delete";
        $.ajax({
            type: 'GET',
            url: url,
            data: "idp=" + idp,
            success: function (data, textStatus, jqXHR) {
                alert("Registro Eliminado!");
            }
        });
    }
});
