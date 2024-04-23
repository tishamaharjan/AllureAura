export const Button = ({ label, onClick, color }) => {
    return (
      <div
        style={{
          ...buttonStyles.container,
          backgroundColor: color === "secondary" ? "#7BD3EA" : "red",
        }}
        onClick={onClick}
      >
        <div style={{ textAlign: "center" }}>{label}</div>
      </div>
    );
  };
  
  const buttonStyles = {
    container: {
      borderRadius: "9px",
      padding: "10px",
      color: "#ffffff",
      fontSize: 16,
      fontWeight: "bold",
      cursor: "pointer",
      width: "50%",
      boxSizing: "border-box",
      margin: "auto",
      marginTop: "10px",
    },
  };
  
  